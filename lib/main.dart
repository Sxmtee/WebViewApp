import 'package:flutter/material.dart';
import 'package:webviewapp/WebViewClass.dart';
import 'package:webviewapp/WebViewPractical.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "assignment",
      home: WebViewApp(),
    );
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("TWITTER"),
        centerTitle: true,
        leading: Icon(
          Icons.home,
          size: 30.0,
        ),
        actions: [
          Icon(Icons.settings, size: 20.0),
        ],
        elevation: 30.0,
        shadowColor: Colors.cyanAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              Container(
                width: size.width,
                child: MaterialButton(
                  shape: StadiumBorder(),
                  onPressed: () {
                    var route =
                        MaterialPageRoute(builder: (context) => WebViewClass());
                    Navigator.push(context, route);
                  },
                  color: Colors.black12,
                  child: Text("Web View Class"),
                  textColor: Colors.greenAccent,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: size.width,
                child: MaterialButton(
                  shape: StadiumBorder(),
                  onPressed: () {
                    var route = MaterialPageRoute(
                        builder: (context) => WebViewPractical());
                    Navigator.push(context, route);
                  },
                  color: Colors.black12,
                  child: Text("Web View Practical"),
                  textColor: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
