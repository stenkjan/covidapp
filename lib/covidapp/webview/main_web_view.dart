import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/webview/web_view.dart';
import 'package:covidapp/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WebMain extends StatefulWidget {
  const WebMain({Key? key}) : super(key: key);

  @override
  WebMainState createState() => WebMainState();
}

class WebMainState extends State<WebMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override

  /// Widget build 3 Übungen Classes. On Card Click  */

  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF313237),

      ///
      /// Appbar
      ///
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        backgroundColor: const Color(0xFF313237),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
                PageRouteBuilder(pageBuilder: (_, __, ___) => const Home()));
          },
        ),
        title: const Text(
          "Aktuelle Informationen zu Long-Covid",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Sans",
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
                color: Color.fromARGB(124, 184, 184, 185),
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _card(
              calContent.urlMapDesc.keys.elementAt(0),
              calContent.urlMap.keys.first,
              calContent.urlMapDesc.values.elementAt(0),
            ),
            _card(
              calContent.urlMapDesc.keys.elementAt(1),
              calContent.urlMap.keys.elementAt(1),
              calContent.urlMapDesc.values.elementAt(1),
            ),
            _card(
              calContent.urlMapDesc.keys.elementAt(2),
              calContent.urlMap.keys.elementAt(2),
              calContent.urlMapDesc.values.elementAt(2),
            ),
            _card(
              calContent.urlMapDesc.keys.elementAt(3),
              calContent.urlMap.keys.elementAt(3),
              calContent.urlMapDesc.values.elementAt(3),
            ),
            _card(
              calContent.urlMapDesc.keys.elementAt(4),
              calContent.urlMap.keys.elementAt(4),
              calContent.urlMapDesc.values.elementAt(4),
            ),
            _card(
              calContent.urlMapDesc.keys.elementAt(5),
              calContent.urlMap.keys.elementAt(5),
              calContent.urlMapDesc.values.elementAt(5),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Widget for card
  ///
  Widget _card(AssetImage image, String title, String desc) {
    final calContent = Provider.of<CalendarContent>(context);
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 15.0, right: 15.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          if (title == calContent.urlMap.keys.first) {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const WebViewExample(
                      webIndex: 0,
                    )));
          }
          if (title == calContent.urlMap.keys.elementAt(1)) {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const WebViewExample(
                        webIndex: 1,
                      )),
            );
          }
          if (title == calContent.urlMap.keys.elementAt(2)) {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const WebViewExample(
                      webIndex: 2,
                    )));
          }
          if (title == calContent.urlMap.keys.elementAt(3)) {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const WebViewExample(
                      webIndex: 3,
                    )));
          }
          if (title == calContent.urlMap.keys.elementAt(4)) {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const WebViewExample(
                      webIndex: 4,
                    )));
          }
          if (title == calContent.urlMap.keys.elementAt(5)) {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const WebViewExample(
                      webIndex: 5,
                    )));
          }
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFF363940),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 170.0,
                width: 4.0,
                decoration: const BoxDecoration(
                    color: Color(0xFF15EDED),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65.0),
                child: Image(
                  image: image,
                  height: 50.0,
                  width: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: SizedBox(
                  width: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w800,
                            fontSize: 16.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 15.0),
                        child: Text(
                          desc,
                          style: const TextStyle(
                              color: Colors.white54,
                              fontFamily: "Popins",
                              fontSize: 13.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
