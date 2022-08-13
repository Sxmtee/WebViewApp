import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewClass extends StatefulWidget {
  const WebViewClass({Key? key}) : super(key: key);

  @override
  State<WebViewClass> createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web View"),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: "https://google.com",
        onWebViewCreated: (WebViewController webViewControler) {
          _completer.complete(webViewControler);
        },
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (progress) {
          print(progress);
        },
      ),
    );
  }
}
