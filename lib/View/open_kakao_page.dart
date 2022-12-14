import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenKakaoPage extends StatelessWidget {
  const OpenKakaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://open.kakao.com/o/sHjnH1Se',
          debuggingEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
