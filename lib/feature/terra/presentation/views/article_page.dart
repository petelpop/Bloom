import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/terra/data/article_dummy.dart';
import 'package:bloom/feature/terra/data/model/article.dart';
import 'package:bloom/feature/terra/presentation/methods/article_item.dart';
import 'package:bloom/feature/terra/presentation/views/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                PrimaryText(
                  text: "Artikel Terra",
                  color: neutralDefault,
                  lineHeight: 1.4,
                  letterSpacing: -0.2,
                  fontSize: 18,
                  fontWeight: 700,
                ),
                SizedBox(height: 2),
                PrimaryText(
                  text: "Baca, dan jadi #SiPalingPaham cara menjaga bumi!",
                  fontSize: 14,
                  color: neutralTertiary,
                  fontWeight: -0.1,
                  lineHeight: 1.4,
                ),
                SizedBox(height: 24),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: articleDummyTitle.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 240,
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(ArticleDetailPage.routeName, extra: ArticleModel(
                            title: articleDummyTitle[index],
                            url: articleDummyLink[index]
                          ));
                        },
                        child: ArticleItem(
                            title: articleDummyTitle[index],
                            desc: articleDummyDesc[index],
                            img: articleDummyImage[index]),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
