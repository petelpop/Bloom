import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/flora/data/gemini_model.dart';
import 'package:bloom/feature/flora/presentation/methods/chatbot_design.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatbotPage extends StatefulWidget {
  static const String routeName = 'chatbot-page';
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final Gemini gemini = Gemini.instance;
  TextEditingController? _textEditingController;
  List<ChatMessage> messages = [];
  String? textValue;

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
          text: "Halo!, yuk tanya hal hal tentang lingkungan ke flora!",
          createdAt: DateTime.now()),
    ];

      gemini.prompt(
        generationConfig: GenerationConfig(
          temperature: 1,
          maxOutputTokens: 8192,
          topK: 40,
          topP: 0.95,
        ),
        model: geminiModelString,
      parts: [
      Part.text(geminiModelString),
      ]).then((value) {
        setState(() {
          LoggerService.info("Ini info value $value");
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            side: BorderSide(
                strokeAlign: 2,
                color: Color(0xFFF2F5F8),
                style: BorderStyle.solid)),
        title: Row(
          children: [
            Image.asset(
              Constants.icFloraProfile,
              width: 30,
            ),
            const SizedBox(width: 12),
            PrimaryText(
              text: "Flora",
              fontSize: 18,
              fontWeight: 700,
              letterSpacing: -0.2,
              lineHeight: 1.4,
              color: neutralDefault,
            )
          ],
        ),
      ),
      body: DashChat(
        currentUser: currentUser,
        onSend: _sendMessage,
        messages: messages,
        readOnly: false,
        inputOptions: InputOptions(
          textController: _textEditingController,
          onTextChange: (value) {
            setState(() {
              textValue = value;
            });
          },
          sendButtonBuilder: (send) {
            if (textValue?.isEmpty == true || textValue == null) {
              return Container(
                margin: const EdgeInsets.only(left: 12),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: neutralGray,
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Constants.icUnavailableSend, width: 0.15,),
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(left: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: send,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: primaryColor600,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(Constants.icAvailableSend, width: 0.15,),
                    ),
                  ),
                ),
              );
            }
          },
            alwaysShowSend: true,
            textInputAction: TextInputAction.send,
            inputTextStyle: const TextStyle(
              fontFamily: 'Satoshi',
              fontVariations: [FontVariation("wght", 400)],
            )),
        messageOptions: MessageOptions(
            showOtherUsersAvatar: false,
            showOtherUsersName: false,
            showTime: true,
            currentUserContainerColor: whiteColor,
            currentUserTextColor: neutralDefault,
            messageDecorationBuilder: messageDecoration,
            messageTextBuilder: (ChatMessage currentMessage,
                ChatMessage? previousMessage, ChatMessage? nextMessage) {
              if (currentMessage.user.id == "0") {
                return PrimaryText(
                  text: currentMessage.text,
                  letterSpacing: -0.1,
                  lineHeight: 1.4,
                  color: neutralDefault,
                );
              } else {
                return PrimaryText(
                  text: currentMessage.text,
                  letterSpacing: -0.1,
                  lineHeight: 1.4,
                  color: neutralDefault,
                );
              }
            },
            messageTimeBuilder: (ChatMessage message, bool isCurrentUser) {
              return PrimaryText(
                text: formatTime(message.createdAt),
                fontSize: 10,
                lineHeight: 1.4,
                letterSpacing: -0.1,
                color: currentUser == true ? neutralTertiary : const Color(0xFF979AA2),
                );

            } 
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
          String response = event.content?.parts?.whereType<TextPart>().fold(
                  "", (previous, current) => "$previous  ${current.text}") ??
              "";

          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.whereType<TextPart>().fold(
                  "", (previous, current) => "$previous  ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);
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
