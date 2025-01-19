import 'package:dash_chat_2/dash_chat_2.dart';

class ChatModel {
  final String text;
  final ChatUser user;
  final DateTime createdAt;

  ChatModel({
    required this.text,
    required this.user,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'user': user,
      'createdAt': createdAt.toIso8601String(), 
    };
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      text: json['text'],
      user: json['user'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
