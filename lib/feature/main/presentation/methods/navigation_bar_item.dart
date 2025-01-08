import 'dart:io';

import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final String imageSelected;
  final String imageUnselect;

  const BottomNavBarItem(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.title,
      required this.imageSelected,
      required this.imageUnselect});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Platform.isAndroid ? null : 80,
      padding: EdgeInsets.all(Platform.isAndroid ? 15 : 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isSelected == true ? imageSelected : imageUnselect,
            width: 24,),
          PrimaryText(
            text: title,
            fontSize: 10,
            fontWeight: isSelected == true ? 700 : 500,
            color: isSelected == true ? primaryColor600 : neutralAccent2,
          )
        ],
      ),
    );
  }
}
