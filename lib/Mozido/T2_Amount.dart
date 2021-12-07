
import 'package:covidapp/Mozido/calendar_view/T2_Grafik.dart';
import 'package:covidapp/Mozido/calendar_view/T2_Kalender.dart';
import 'package:flutter/material.dart';



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
        brightness: Brightness.dark,
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
                          left: 20.0, right: 20.0, top: 20.0),
                      child: T2_kalender(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: Expanded(
                        child:T2_grafik(),
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
