// @dart=2.9
import 'package:covidapp/Mozido/login/wrapper.dart';
import 'package:covidapp/Mozido/services/auth_service.dart';
import 'package:covidapp/Mozido/services/grafik_service.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Mozido/content/calendar_content.dart';
import 'Mozido/services/calendar_service.dart';

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

            //     StreamProvider<FirebaseUser>.value(stream: FirebaseAuth.instance.onAuthStateChanged),
            // //   //Provider(create: (context) => UserModel)
            //     ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            //       create: (context) => CartModel(),
            //       update: (context, catalog, cart) {
            //         if (cart == null) throw ArgumentError.notNull('cart');
            //         cart.catalog = catalog;
            //         return cart;
            //       },
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
        child: MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('de', 'AT'),
              Locale('de', 'DE'),
            ],
            //return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            /*    routes: {
              "/": (context) => Wrapper(),
              "T2_Amount": (context) => T2Amount(),
              "T2_Investment": (context) => T2_Investment(),
              "T2_Search": (context) => T2_Search(),
              "PieChart": (context) => PieChart(),
              "SignInScreen": (context) => SignInScreen(),
              "SettingsUI": (context) => SettingsScreen(),
            }, */
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
/* 
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*  void setupDatabase() {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.reference.child("test");
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
 */