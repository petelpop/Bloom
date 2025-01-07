import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticleItem extends StatelessWidget {
  final String title;
  final String desc;
  final String img;
  const ArticleItem({super.key, required this.title, required this.desc, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: 
      BoxConstraints(
        minHeight: 206,
        maxHeight: 300

      ),
      width: 192,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.04),
            blurRadius: 20
          )
        ],
        color: whiteColor,
        border: Border.all(
          color: surface300,
          width: 1
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 116,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Image.network(
              img, 
              fit: BoxFit.cover,
              errorBuilder:(context, error, stackTrace) {
                return Image.asset(Constants.imgPlaceHolder, fit:BoxFit.cover);
              },),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: title,
                  lineHeight: 1.4,
                  letterSpacing: -0.1,
                  color: neutralDefault,
                  fontWeight: 600,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 4,),
                  
                  PrimaryText(
                    text: desc,
                    fontSize: 12,
                    color: neutralTertiary,
                    lineHeight: 1.4,
                    letterSpacing: -0.1,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )

              ],
            ),
          ),
        ],
      ),
    );
  }
}