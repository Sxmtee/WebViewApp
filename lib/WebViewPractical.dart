import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:regexpattern/regexpattern.dart';

class WebViewPractical extends StatefulWidget {
  const WebViewPractical({Key? key}) : super(key: key);

  @override
  State<WebViewPractical> createState() => _WebViewPracticalState();
}

class _WebViewPracticalState extends State<WebViewPractical> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  var searchcontroller = new TextEditingController();

  String? InitialUrl;

  bool isSearching = false;

  void StartSearch(String url) {
    setState(() {
      isSearching = true;
    });

    bool isUrl = url.isUrl();
    if (isUrl) {
      //continue
      if (!url.startsWith("https://")) {
        url = "https://" + url;
      }
      setState(() {
        InitialUrl = url;
      });
    } else {
      showSnackBar("Invalid Url");
    }
  }

  showSnackBar(String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.url,
                controller: searchcontroller,
                decoration: InputDecoration(
                  hintText: "Enter Url",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                onFieldSubmitted: (value) {
                  StartSearch(value);
                },
              ),
              Visibility(visible: isSearching, child: LinearProgressIndicator())
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  StartSearch(searchcontroller.text);
                },
                icon: Icon(Icons.search)),
          ],
          leading: IconButton(
              onPressed: () {
                StartSearch(searchcontroller.text);
              },
              icon: Icon(Icons.replay)),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: InitialUrl == null
                    ? Center(child: Text("SOMTEE BROWSER"))
                    : WebView(
                        initialUrl: InitialUrl,
                        onWebViewCreated: (WebViewController webViewControler) {
                          _completer.complete(webViewControler);
                        },
                        javascriptMode: JavascriptMode.unrestricted,
                        onPageStarted: (url) {
                          setState(() {
                            isSearching = true;
                          });
                        },
                        onPageFinished: (url) {
                          setState(() {
                            isSearching = false;
                          });
                        },
                      ),
              )
            ],
          ),
        ));
  }
}
