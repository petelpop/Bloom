import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModalTopBar extends StatelessWidget {
  final String title;
  final Widget view;

  const ModalTopBar({
    super.key,
    required this.title,
    required this.view,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.93,
      initialChildSize: 0.93,
      builder: (context, scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryText(
                      text: title,
                      fontSize: 12,
                    ),
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Divider(
                color: neutralAccent1,
              ),
              Expanded(child: view),
            ],
          ),
        );
      },
    );
  }
}
