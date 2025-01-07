import 'package:bloom/common/constants.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
          currentUser: currentUser, onSend: _sendMessage, messages: messages),
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
              ?.fold("", (previous, current) => "$previous $current") ?? "";
              lastMessage.text += response;
              setState(() {
                messages = [lastMessage!, ...messages];
              });
        } else {
          String response = event.content?.parts
              ?.fold("", (previous, current) => "$previous $current") ?? "";
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
