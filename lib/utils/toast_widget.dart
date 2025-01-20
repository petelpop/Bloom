import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum ToastPosition { TOP, BOTTOM, CENTER }

class ToastWidget {
  static FlushbarPosition getToastPosition(ToastPosition toastPosistion) {
    switch (toastPosistion) {
      case ToastPosition.TOP:
        return FlushbarPosition.TOP;
      case ToastPosition.CENTER:
        return FlushbarPosition.TOP;
      case ToastPosition.BOTTOM:
        return FlushbarPosition.BOTTOM;
    }
  }

  static void showToast(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    ToastPosition position = ToastPosition.TOP,
    Color color = const Color.fromRGBO(51, 51, 51, 1),
    Function()? onBuild,
    void Function(FlushbarStatus?)? onStatusChanged,
  }) {
    if (onBuild != null) {
      onBuild();
    }
    Flushbar(
      onStatusChanged: onStatusChanged,
      icon: const Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
      shouldIconPulse: false,
      margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: getToastPosition(position),
      backgroundColor: color,
      message: message,
      messageSize: 16,
      duration: duration,
    ).show(context);
  }
}
