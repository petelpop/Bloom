import 'dart:convert'; 
import 'package:bloom/feature/flora/data/model/chat_model.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageBloom {
  final FlutterSecureStorage _storage = FlutterSecureStorage();


  Future<void> saveMessages(List<ChatModel> messages) async {
    try {
      List<Map<String,dynamic>> messageList = messages
          .map((message) => ChatModel(
            text: message.text, 
            user: message.user, 
            createdAt: message.createdAt).toJson())
          .toList();
      await _storage.write(key: 'chatMessages', value: jsonEncode(messageList));

      LoggerService.info("message list $messageList");
    } catch (e) {
      print("Error saving messages to storage: $e");
    }
  }

  Future<List<ChatModel>> loadMessages() async {
    try {
      String? storedMessages = await _storage.read(key: 'chatMessages');
      LoggerService.info("message dari loadMessage $storedMessages");
      if (storedMessages != null) {
        print("masuk storedMessages != null");
        List<Map<String,dynamic>> decodedList = jsonDecode(storedMessages);
        LoggerService.log("decoded list $decodedList");
        List<ChatModel> loadedMessages = decodedList
            .map((messageJson){
              LoggerService.info("ini json $messageJson");
             return ChatModel.fromJson(messageJson);
            }
             )
            .toList();
            LoggerService.info("masuk storedMessages $loadedMessages");
        return loadedMessages;
      }
      return [];
    } catch (e) {
      print("Error loading messages from storage: $e");
      return [];
    }
  }
}
