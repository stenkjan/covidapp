import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

import 'covidapp/login/wrapper.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>(debugLabel: "introKey");

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Wrapper()),
    );
  }

 

  Widget _buildImage(String assetName) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset(
        assetName,
        height: MediaQuery.of(context).size.height - 15,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
        gaplessPlayback: true,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  static bool logoB = true;
  static Color dotBarColor = const Color.fromARGB(153, 2, 37, 58);
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 19.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 1.0,
      shadows: <Shadow>[
        Shadow(color: Colors.black, offset: Offset(1, 2), blurRadius: 0.5),
        Shadow(color: Colors.black12, offset: Offset(1, 2), blurRadius: 1.0),
      ],
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        shadows: <Shadow>[
          Shadow(color: Colors.black, offset: Offset(0, 3), blurRadius: 1.0),
          Shadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 2.0),
        ],
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color.fromARGB(69, 123, 148, 160),
      imagePadding: EdgeInsets.only(bottom: 60),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: const Color.fromARGB(255, 50, 37, 231),
      onChange: (value) {
        setState(() {
          if (value >= 1 && value <= 5) {
            dotBarColor = const Color.fromARGB(153, 2, 37, 58);
          } else if (value >= 6 && value <= 11) {
            dotBarColor = const Color.fromARGB(15, 2, 36, 58);
          } else if (value == 12) {
            dotBarColor = const Color.fromARGB(153, 2, 37, 58);
          }
          logoB = false;
        });
      },
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Visibility(
                      visible: logoB,
                      child: const Text(
                        'Long Covid App',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2.0,
                          wordSpacing: 2.0,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                                color: Colors.black,
                                offset: Offset(2, 1),
                                blurRadius: 1.0),
                            Shadow(
                                color: Colors.black12,
                                offset: Offset(2, 1),
                                blurRadius: 2.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'images/long_covid_logo.png',
                      height: 35,
                      width: 35,
                      color: const Color.fromRGBO(3, 169, 244, 1),
                    ),
                  ),
                ],
              )),
        ),
      ),
      globalFooter: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          width: double.infinity,
          height: 40,
          color: const Color(0xFF31A1C9),
          child: ElevatedButton(
            child: const Text(
              'Überspringen',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => _onIntroEnd(context),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Willkommen",
          body:
              "Einführung in die Long Covid App, Symptomtracking bei Verdacht auf Langzeitfolgen von Long Covid.",
          image: _buildImage("images/forest_foggy_above.png"),

          // ontop foggy forest avif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Überwache den täglichen Verlauf deiner Long Covid Symptome",
          body:
              "Auf Basis des RKI-Klassifizierungsmodells von Long Covid Symptomen täglich Symptome aufzeichnen und grafisch visualisieren lassen.",
          image: _buildImage("images/inside_forest.gif"), // inside forest gif
          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
            fullScreen: true,
            bodyFlex: 4,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Pulsschlag und Atemfrequenz",
          body:
              "Mittels integriertem Kamera-Tool den Pulsschlag messen und mittels individuell einstellbarer Atemübung tägliche Fortschritte überwachen.",
          image: _buildImage(
              "images/car_mountain_drive.gif"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
      
        PageViewModel(
          title: "Übersicht",
          body:
              "Durch die neuesten Informationen rund um Long Covid die Genesung unterstützen. Treten Sie bei Fragen jederzeit mit uns in Kontakt.",
          image:
              _buildImage("images/ontop_forest_river.gif"), // inside forest gif
          // sunset gif
          footer: ElevatedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF31A1C9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Kontakt',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
            fullScreen: true,
            bodyFlex: 4,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Der Krankheit einen Schritt voraus",
          body:
              "Selbstständig auf den Weg der Besserung: Durch täglische Interaktionen im Gesesungsprozess involviert sein. Entwickeln Sie ein gesamtheitliches Verständnis über Ihre Symptome im Laufe eines Monats. ",

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
            fullScreen: true,
            bodyFlex: 4,
            imageFlex: 3,
          ),
          image: _buildImage("images/star_walk.gif"), // inside forest gif
          //man walk on stars gif,

          reverse: false,
        ),
        PageViewModel(
          title: "Tutorial",
          body:
              "Durch die neuesten Informationen rund um Long Covid die Genesung unterstützen. Treten Sie bei Fragen jederzeit mit uns in Kontakt.",
          image: _buildImage("images/tutorial/tut1.png"), // inside forest gif
          // sunset gif

          decoration: pageDecoration.copyWith(
            pageColor: const Color.fromARGB(158, 123, 148, 160),
            contentMargin:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 130),
            fullScreen: true,
            bodyFlex: 3,
            imageFlex: 3,
            imageAlignment: Alignment.topCenter,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image:
              _buildImage("images/tutorial/tut2.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            imageAlignment: Alignment.topCenter,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image:
              _buildImage("images/tutorial/tut3.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 4,
            imageAlignment: Alignment.topCenter,
            imagePadding: const EdgeInsets.only(left: 20),
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image:
              _buildImage("images/tutorial/tut4.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            imageAlignment: Alignment.topCenter,
            imagePadding: const EdgeInsets.only(bottom: 50),
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image:
              _buildImage("images/tutorial/tut5.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            imageAlignment: Alignment.topCenter,
            imagePadding: const EdgeInsets.only(top: 20),
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image:
              _buildImage("images/tutorial/tut6.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 100),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            imageAlignment: Alignment.topCenter,
            imagePadding: const EdgeInsets.only(bottom: 60),
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image:
              _buildImage("images/tutorial/tut7.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            imageAlignment: Alignment.topCenter,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image:
              _buildImage("images/tutorial/tut8.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 30),
            fullScreen: true,
            bodyFlex: 3,
            imageFlex: 5,
            imageAlignment: Alignment.topCenter,
            imagePadding: const EdgeInsets.only(right: 20),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
     showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
     
      back: const Icon(Icons.arrow_back),
      skip: const Text('Überspringen',
          style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Fertig', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(5.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(7.0, 7.0),
        spacing: EdgeInsets.all(5),
        color: Color(0xFFBDBDBD),
        activeSize: Size(11.0, 11.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: dotBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
