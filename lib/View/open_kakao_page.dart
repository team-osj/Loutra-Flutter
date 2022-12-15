import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenKakaoPage extends StatefulWidget {
  const OpenKakaoPage({Key? key}) : super(key: key);

  @override
  State<OpenKakaoPage> createState() => _OpenKakaoPageState();
}

class _OpenKakaoPageState extends State<OpenKakaoPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://open.kakao.com/o/sHjnH1Se',
      debuggingEnabled: true,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
