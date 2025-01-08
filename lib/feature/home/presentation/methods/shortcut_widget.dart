import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';

class ShortcutWidget extends StatelessWidget {
  String icon;
  String text;
  String desc;

  ShortcutWidget(
      {super.key, 
      required this.icon,
      required this.text, 
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          minHeight: 110, maxHeight: 120, minWidth: 180, maxWidth: 193),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: whiteColor,
          border: Border.all(
            color: surface300,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.04),
              blurRadius: 20,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 13, right: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: surface200),
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Image.asset(icon),
              ),
            ),
            SizedBox(height: 12),
            PrimaryText(
              text: text,
              fontSize: 14,
              fontWeight: 700,
              letterSpacing: -0.1,
              lineHeight: 1.4,
              color: neutralDefault,
            ),
            PrimaryText(
              text: desc,
              fontSize: 12,
              letterSpacing: -0.1,
              lineHeight: 1.4,
              color: neutralTertiary,
              fontWeight: 400,
            )
          ],
        ),
      ),
    );
  }
}
