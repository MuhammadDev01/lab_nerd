import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepo {
//**Login With Email and Password**\\
  static String _errorMessage = '';
  static Future<String> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _errorMessage = 'Account Not Found, Signup First';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'Wrong Password, Try Again';
      } else if (e.code == 'invalid-credential') {
        _errorMessage = 'Email or Password is incorrect';
      } else {
        _errorMessage = e.message!;
        log('status code : ${e.code}, error : ${e.message}');
      }
      return _errorMessage;
    } catch (e) {
      return _errorMessage = 'Something went wrong';
    }
  }

  static Future<UserCredential> loginWithFirebaseGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('Error: $e');
      return Future.error('Failed to sign in with Google: $e');
    }
  }
}
