import 'dart:convert'; // To use jsonEncode and jsonDecode
import 'package:bloom/feature/flora/data/model/chat_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();


  // Save messages to secure storage
  Future<void> saveMessages(List<ChatModel> messages) async {
    try {
      List<String> messageList = messages
          .map((message) => jsonEncode(message.toJson()))
          .toList();
      await _storage.write(key: 'chatMessages', value: jsonEncode(messageList));
    } catch (e) {
      print("Error saving messages to storage: $e");
    }
  }

  Future<List<ChatModel>> loadMessages() async {
    try {
      String? storedMessages = await _storage.read(key: 'chatMessages');
      if (storedMessages != null) {
        List<dynamic> decodedList = jsonDecode(storedMessages);
        List<ChatModel> loadedMessages = decodedList
            .map((messageJson) => ChatModel.fromJson(messageJson))
            .toList();
        return loadedMessages;
      }
      return [];
    } catch (e) {
      print("Error loading messages from storage: $e");
      return [];
    }
  }
}
