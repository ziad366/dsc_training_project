import 'package:firebase_auth/firebase_auth.dart';

import 'database_service.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // final DatabaseService _databaseService = DatabaseService();

  Future<String> signup(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        //TODO database operation
        print("User ID: ${result.user!.uid}");
        return "User Account Has been Created...";
      }
      return "Something went wrong, please try again later...";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<String> login(
      {required String email, required String password}) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return "loggedIn Successfully";
      }
      return "Something went wrong, please try again later...";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<String> signOut() async {
    try {
      await _auth.signOut();
      return "signedOut Successfully...";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<String?> recoverPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "Email has been sent!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
