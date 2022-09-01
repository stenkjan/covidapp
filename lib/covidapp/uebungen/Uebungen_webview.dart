import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {
  const Webview({Key? key}) : super(key: key);

  @override

  /// Widget build Webview on click Atemübungensymbol  */

  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber),
      title: "longcovidapp.at",
      home: const Webviewpage(),
    );
  }
}

class Webviewpage extends StatelessWidget {
  const Webviewpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        backgroundColor: const Color(0xFF313237),
        centerTitle: true,
        title: const Text(
          "Atemübungen",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Sans",
              fontSize: 17.0,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: const SizedBox(
          width: double.infinity,
       
          // Link to covidapp.at
          child: WebView(
            initialUrl: 'https://www.longcovidapp.at/blog',
            // Enable Javascript on WebView
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}
