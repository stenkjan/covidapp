// @dart=2.9
import 'package:covidapp/covidapp/calendar_view/calendar_tab_bar.dart';
import 'package:covidapp/covidapp/login/wrapper.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/covidapp/services/exercise_service.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';
import 'package:covidapp/covidapp/uebungen/breathing/breathe_main.dart';
import 'package:covidapp/covidapp/uebungen/puls_messung/puls_analyse.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'covidapp/content/calendar_content.dart';
import 'covidapp/services/calendar_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
///main widget 
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  final GlobalKey<NavigatorState> breathKey = GlobalKey<NavigatorState>();
  MyApp({Key key}) : super(key: key);

  // initializing provider classes and routes
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
          Provider<CalendarService>(
            create: (_) => CalendarService(),
          ),
          ChangeNotifierProvider<CalendarContent>(
            create: (context) => CalendarContent(),
          ),
          Provider<GrafikService>(
            create: (_) => GrafikService(),
          ),
          Provider<ExerciseService>(
            create: (_) => ExerciseService(),
          ),
        ],
        child: MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            routes: {
              '/calendar': (_) => const CalendarTabBar(),
              '/breathe': (_) => const UebungBreathing(),
              '/pulse': (_) => const PulsAnalyse(),
            },
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('de', 'AT'),
              Locale('de', 'DE'),
            ],
            title: 'Covidapp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: FutureBuilder(
              future: _fbApp,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print("Snapshot Error:  ${snapshot.error.toString()}");
                  }
                  return const Text("Etwas ist schief gelaufen");
                } else if (snapshot.hasData) {
                  return const Wrapper();
                } else {
                  return const Center(
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            )));
  }
}
