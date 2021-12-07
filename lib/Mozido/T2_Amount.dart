
import 'package:covidapp/Mozido/calendar_view/T2_Grafik.dart';
import 'package:covidapp/Mozido/calendar_view/T2_Kalender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'content/size.dart';



class T2_Amount extends StatefulWidget {
  T2_Amount({Key? key}) : super(key: key);

  _T2_AmountState createState() => _T2_AmountState();
}

class _T2_AmountState extends State<T2_Amount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF313237),

      ///
      /// Appbar
      ///
      appBar: AppBar(
        title: Text(
          "Kalender/ Entwicklung",
          style: TextStyle(
              color: Colors.white, fontFamily: "Popins", fontSize: 18.0),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Color(0xFF313237),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.lightBlue),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),

          ///
          /// Custom tab bar
          ///
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: new Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(42.0), // here the desired height
                  child: new AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    title: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(color: Colors.black54),
                          color: Colors.black26),
                      child: new TabBar(
                        indicatorColor: Color(0xFF31A1C9),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white54,
                        indicator: ShapeDecoration.fromBoxDecoration(
                            BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Color(0xFF31A1C9))),
                        tabs: [
                          new Tab(
                            child: Text(
                              "Kalender",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          new Tab(
                              child: Text(
                            "Grafik",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),

                ///
                /// Body tabBar
                ///
                body: new TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 5.0),
                      child: T2Kalender(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 5.0),
                        child:
                        Container(
                          width: SizeConfig.getWidth(context),
                          decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                              color: Colors.blue[900]!.withOpacity(0.1),
                              blurRadius: 50,
                              spreadRadius: 40,
                              offset: Offset(40, 0)),
                            BoxShadow(
                                color: Colors.white12,
                                blurRadius: 30,
                                spreadRadius: 20,
                                offset: Offset(20, 0)),
                          ], shape: BoxShape.circle, color: Colors.white30),
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.getWidth(context) / 50, vertical: SizeConfig.getHeight(context) / 100),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                top: 150,
                                bottom: -100,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Color(0xFF31A1C9).withOpacity(0.6),
                                        blurRadius: 50,
                                        spreadRadius: 20,
                                        offset: Offset(20, 0)),
                                    BoxShadow(
                                        color: Colors.white12,
                                        blurRadius: 50,
                                        spreadRadius: 20,
                                        offset: Offset(0, 0)),
                                  ], shape: BoxShape.circle, color: Colors.white30),
                                ),
                              ),
                              Positioned.fill(
                                top: -100,
                                bottom: -100,
                                left: -300,
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Color(0xFF31A1C9).withOpacity(0.2),
                                        blurRadius: 300,
                                        spreadRadius: 40,
                                        offset: Offset(10, 0)),
                                    BoxShadow(
                                        color: Color(0xFF31A1C9),
                                        blurRadius: 150,
                                        spreadRadius: 80,
                                        offset: Offset(20, 0)),
                                  ], shape: BoxShape.circle, color: Colors.white30),
                                ),
                              ),

                              //FormDesignScrollView(),

                              T2Grafik(),
                              //FormDesignScrollView(),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
