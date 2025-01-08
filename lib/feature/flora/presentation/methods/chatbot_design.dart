import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// Message Container
BoxDecoration messageDecoration(
    ChatMessage currentMessage, ChatMessage? previousMessage, ChatMessage? nextMessage) {
  // TODO : ME
  if (currentMessage.user.id == "0") { 
    return BoxDecoration(
      color: whiteColor,
      border: Border.all(
        color: surface300,
        width: 1.5
      ),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
    );
  } else {
    // TODO : FLORA
    return BoxDecoration(
      color: surface300,
      borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
      border: Border.all(
        color: surface400,
        width: 1.5
      )
    );
  }
}

    String formatTime(DateTime dateTime) {
  return DateFormat('hh:mm a').format(dateTime); 
}