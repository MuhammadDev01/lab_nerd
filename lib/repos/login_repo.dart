import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepo {
//**Login With Email and Password**\\
  static String errorMessage = '';
  static String? userToken;
  static Future<String> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userToken = FirebaseAuth.instance.currentUser?.uid;
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'Account Not Found, Signup First';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong Password, Try Again';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Email or Password is incorrect';
      } else {
        errorMessage = e.message!;
        log('status code : ${e.code}, error : ${e.message}');
      }
      return errorMessage;
    } catch (e) {
      return errorMessage = 'Something went wrong';
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
