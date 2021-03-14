import 'package:ProfessionConnect/models/user.dart';

import 'package:ProfessionConnect/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  Future<bool> gSignIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      AuthResult result = await _auth.signInWithCredential(credential);
      // FirebaseUser user = result.user;
      FirebaseUser user = await _auth.currentUser();

      print(user.uid);
      // return user;
      return Future.value(true);
    }
  }

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(user.uid, user.email) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      // await DatabaseService(uid: user.uid)
      //     .updateUserData('0', 'new crew member', 100);

      await DatabaseService.withuid(uid: user.uid)
          .addDataDuringRegistration(email: user.email);

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    FirebaseUser user = await _auth.currentUser();
    if (user.providerData[1].providerId == 'google.com') {
      await googleSignIn.disconnect();
    }
    return await _auth.signOut();
    // try {
    //   // await googleSignIn.disconnect();
    //   return await _auth.signOut();
    // } catch (error) {
    //   print(error.toString());
    //   return null;
    // }
  }
}
