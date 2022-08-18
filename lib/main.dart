import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.4),
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
            child: Stack(
              children: [
                SizedBox(
                  width: 200,
                  height: 300,
                  child: InAppWebView(
                    initialFile: "assets/index.html",
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        transparentBackground: true,
                      ),
                    ),
                    onLoadError: ((controller, url, code, message) {
                      print(message);
                      final snackBar = SnackBar(
                        content: Text(message),
                        backgroundColor: (Colors.black12),
                        action: SnackBarAction(
                          label: 'dismiss',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }),
                    onLoadHttpError: (controller, url, statusCode, description) {
                      print(description);
                      final snackBar = SnackBar(
                        content: Text(description),
                        backgroundColor: (Colors.black12),
                        action: SnackBarAction(
                          label: 'dismiss',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ),
                Container(
                  width: 200,
                  height: 300,
                  alignment: Alignment.center,
                  child: Image.asset(
                    width: 200,
                    height: 300,
                    "assets/animated_ball.png",
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
