import 'package:classy/model/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  // object
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  //get googleAccount => null;

  //get googleAccount => null;

  // function for login
    login() async {
    googleSignInAccount = await _googleSignIn.signIn();
    //await _googleSignIn.signIn();
    //await _googleSignIn.disconnect();
     print(googleSignInAccount?.email??'');
    print("<<<<<<<<<<<<<<<<<<<<<<");
    // call
    notifyListeners();

  }

  // function to logout
  logout() async {
    // empty the value after logut
    this.googleSignInAccount = await _googleSignIn.signOut();
    //await _googleSignIn.disconnect();

    // call
    notifyListeners();
  }
}