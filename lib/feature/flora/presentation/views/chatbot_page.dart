import 'dart:ffi';

import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/flora/presentation/methods/chatbot_design.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class ChatbotPage extends StatefulWidget {
  static const String routeName = 'chatbot-page';
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "Me");
  ChatUser geminiUser = ChatUser(
      id: "1", firstName: "Flora", profileImage: Constants.icFloraProfile);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messages = [
      ChatMessage(
        user: geminiUser,
        text: "Hello, how are you?",
        createdAt: DateTime.now()
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          side: BorderSide(
            strokeAlign: 2,
            color: Color(0xFFF2F5F8),
            style: BorderStyle.solid
          )
        ),
        title: Row(
          children: [
            Image.asset(
              Constants.icFloraProfile,
              width: 30,
            ),
            SizedBox(width: 12),
            PrimaryText(
              text: "Flora",
              fontSize: 18,
              fontWeight: 700,
              letterSpacing: -0.2,
              lineHeight: 1.4,
              color: neutralDefault,)
          ],
        ),
      ),
      body: DashChat(
          currentUser: currentUser, 
          onSend: _sendMessage, 
          messages: messages,
          inputOptions: InputOptions(
            alwaysShowSend: true,
            textInputAction: TextInputAction.send,
            inputTextStyle: TextStyle(
                      fontFamily: 'Satoshi',
        fontVariations: [
          FontVariation(
            "wght", 400)
        ],
            )
          ),
          messageOptions: MessageOptions(
            showOtherUsersAvatar: false,
            showOtherUsersName: false,
            showTime: true,
            currentUserContainerColor: whiteColor,
            currentUserTextColor: neutralDefault,
            messageDecorationBuilder: messageDecoration,
          ),
          ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts
            ?.whereType<TextPart>() 
            .fold("", (previous, current) => "$previous  ${current.text}") ?? "";

              lastMessage.text += response;
              setState(() {
                messages = [lastMessage!, ...messages];
              });
        } else {
          String response = event.content?.parts
            ?.whereType<TextPart>() 
            .fold("", (previous, current) => "$previous  ${current.text}") ?? "";
          ChatMessage message = ChatMessage(
              user: geminiUser, 
              createdAt: DateTime.now(),
              text: response);
              setState(() {
                messages = [message, ...messages];
              });
        }
      });
    } catch (e) {
      LoggerService.error(e.toString());
    }
  }

}

