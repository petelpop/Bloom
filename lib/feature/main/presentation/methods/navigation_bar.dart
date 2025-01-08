import 'dart:io';

import 'package:bloom/common/colors.dart';
import 'package:bloom/feature/main/presentation/methods/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> items;
  final void Function(int index) onTap;
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            boxShadow: [
          BoxShadow(
            color: neutralGray.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
            color: Color(0xFFF8F8F8),
            width: 1.5    
        ),
      ),
      child: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: Platform.isAndroid ? 70 : 50,
        color: surface100,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: -3,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((e) {
            return InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () => onTap(e.index),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
