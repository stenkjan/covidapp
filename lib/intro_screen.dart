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

  /*  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  } */

  Widget _buildImage(String assetName) {
    // [double width = 350]
    return Scaffold(
      body: Image.asset(
        assetName,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

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
      pageColor: Color.fromARGB(50, 123, 148, 160),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: const Color.fromARGB(255, 50, 37, 231),

      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
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
        padding: const EdgeInsets.only(bottom: 40.0),
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
                const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
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
            bodyFlex: 3,
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
        /* PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ), */
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
              primary: const Color(0xFF15EDED),
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
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 3,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Der Krankheit einen Schritt voraus",
          body:
              "Selbstständig auf den Weg der Besserung: Durch täglische Interaktionen im Gesesungsprozess involviert sein. Entwickeln Sie ein gesamtheitliches Verständnis über Ihre Symptome im Laufe eines Monats. ",

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 3,
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
          image: _buildImage(
              "images/Tutorial_Images/Bild1.png"), // inside forest gif
          // sunset gif
          footer: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                'Überspringen',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () => _onIntroEnd(context),
            ),
          ),
          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 3,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(
              "images/Tutorial_Images/Bild2.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(
              "images/Tutorial_Images/Bild3.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(
              "images/Tutorial_Images/Bild4.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(
              "images/Tutorial_Images/Bild5.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(
              "images/Tutorial_Images/Bild6.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(
              "images/Tutorial_Images/Bild7.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(
              "images/Tutorial_Images/Bild8.png"), // ontop forest river gif

          decoration: pageDecoration.copyWith(
            contentMargin:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(7.0, 7.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(20.0, 7.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color.fromARGB(153, 2, 37, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
