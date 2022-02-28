// @dart=2.9
import 'package:covidapp/covidapp/login/wrapper.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'covidapp/content/calendar_content.dart';
import 'covidapp/services/calendar_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
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
        ],
        child: GetMaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
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
                      child: CircularProgressIndicator(),
                      height: 50.0,
                      width: 50.0,
                    ),
                  );
                }
              },
            )));
  }
}
