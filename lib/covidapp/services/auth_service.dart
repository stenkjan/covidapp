import 'package:covidapp/covidapp/content/strings.dart';
import 'package:covidapp/covidapp/models/user_models.dart';
import 'package:covidapp/covidapp/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  late final DatabaseService dbService;
  static String id = "";
  late String email;
  late User userGet;
  static String _name = "";
  static bool introCheck = false;
  /*  late String userUid; */
  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    userGet = User(user.uid, user.email);
    if (kDebugMode) {
      print('${user.uid} auth');
    }
    id = user.uid;

    // ignore: avoid_print

    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  String getUser() {
    return id;
  }

  String? setName(String fName, String lName) {
    _name = "$fName $lName";
    return _name;
  }

  String? returnName() {
    return _name;
  }

  String getName() {
    dbService = DatabaseService(uid: id);
    if (_firebaseAuth.currentUser != null) {
      if (_name != "") {
        return _name;
      }
      if (_name == "") {
        dbService.getUserData();
        return dbService.returnName();
      } else {
        return _name = "Long Covid App";
      }
    }
    return _name;
  }

  Future<User?> signInWithEmailAndPasswort(
    String email,
    String password,
    bool introCheck,
  ) async {
    final credential;
    try {
      credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      print(' $e');
      return null;
    }
    /* userUid = await (_firebaseAuth.currentUser!.uid); */
  }

  Future<User?> createUserWithEmailAndPasswort(
      String email,
      String password,
      String firstname,
      String lastname,
      String birthday,
      bool introCheck) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      /*  userUid = await (_firebaseAuth.currentUser!.uid); */
      //create a new user doc with uid
      print('waiting');
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await DatabaseService(uid: credential.user!.uid)
          .updateUserData(email, firstname, lastname, birthday, introCheck);
      
      return _userFromFirebase(credential.user);
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          /// Diese Email ist bereits registriert.
          print('email bereits in Verwendung');
        }
        if (signUpError.code == 'ERROR_INVALID_EMAIL') {
          print('Falsches email Format');
        }
        if (signUpError.code == 'ERROR_WEAK_PASSWORD') {
          print('Schwaches Passwort');
        }
      }
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return;
    }
  }
}
