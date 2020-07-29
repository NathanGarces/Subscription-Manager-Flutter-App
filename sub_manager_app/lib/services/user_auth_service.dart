import 'package:injectable/injectable.dart';
import 'dart:async';
//Firebase Imports
import 'package:firebase_auth/firebase_auth.dart';

@lazySingleton
class UserAuthService {
  //Firebase auth object
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser _user;

  Future<String> signUp(String email, String password) async {
    try {
      final FirebaseUser user = (await _firebaseAuth
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
      return user.uid;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signIn(String email, password) async {
    try {
      final FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user.uid;
    } catch (e) {
      rethrow;
    }
  }

  //See if already user is logged in or not
  Future<bool> isLoggedIn() async {
    _user = await _firebaseAuth.currentUser();

    if (_user == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> getUserId() async {
    _user = await _firebaseAuth.currentUser();
    return _user.uid;
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
