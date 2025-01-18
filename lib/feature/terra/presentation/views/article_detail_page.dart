import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/terra/data/model/article.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatefulWidget {
  static const String routeName = "article-detail-Page";

  final ArticleModel data;
  const ArticleDetailPage({super.key, required this.data});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  WebViewController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.data.url!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: widget.data.title!,
          color: neutralDefault,
          fontSize: 16,
          fontWeight: 500,),
      ),
      body: WebViewWidget(controller: controller!),
    );
  }
}
