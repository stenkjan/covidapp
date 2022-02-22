import 'package:covidapp/Mozido/models/user_models.dart';
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  String id = "";
  late String email;
  late User userGet;
  /*  late String userUid; */
  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    userGet = User(user.uid, user.email);
    print(user.uid + ' auth');
    id = user.uid;
    
    print(id);
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }
 String getUser () {
   return id = _firebaseAuth.currentUser!.uid;
 }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    /* userUid = await (_firebaseAuth.currentUser!.uid); */
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPasswort(
    String email,
    String password,
    String firstname,
    String lastname,
    String birthday,
  ) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      /*  userUid = await (_firebaseAuth.currentUser!.uid); */
      //create a new user doc with uid
      await DatabaseService(uid: credential.user!.uid)
          .updateUserData(email, firstname, lastname, birthday);
      return _userFromFirebase(credential.user);
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          /// Diese Email ist bereits registriert.
        }
        if (signUpError.code == 'ERROR_INVALID_EMAIL') {
          /// Diese Email ist nicht korrekt.
        }
      }
    }
  }

  Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
