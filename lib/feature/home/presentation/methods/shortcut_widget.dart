import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';

class ShortcutWidget extends StatelessWidget {
  final String icon;
  final String text;
  final String desc;
  final bool disable;

  ShortcutWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.desc,
    this.disable = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = disable ? surface200 : whiteColor;
    final Color borderColor = disable ? surface300.withOpacity(0.5) : surface300;
    final Color shadowColor = disable ? Colors.transparent : blackColor.withOpacity(0.04);
    final Color iconBackgroundColor = disable ? surface300 : surface200;
    final Color primaryTextColor = disable ? neutralTertiary : neutralDefault;
    final Color secondaryTextColor = disable ? neutralTertiary.withOpacity(0.7) : neutralTertiary;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 13, right: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: iconBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Image.asset(
                  icon,
                  color: disable ? neutralTertiary : null, 
                ),
              ),
            ),
            const SizedBox(height: 12),
            PrimaryText(
              text: text,
              fontSize: 14,
              fontWeight: 700,
              letterSpacing: -0.1,
              lineHeight: 1.4,
              color: primaryTextColor,
            ),
            PrimaryText(
              text: desc,
              fontSize: 12,
              letterSpacing: -0.1,
              lineHeight: 1.4,
              color: secondaryTextColor,
              fontWeight: 400,
            ),
          ],
        ),
      ),
    );
  }
}
