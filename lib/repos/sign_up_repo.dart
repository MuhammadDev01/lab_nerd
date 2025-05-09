import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  static String _errorMessage = '';
  static Future<String> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((credential) async {
        await credential.user!.updateProfile(displayName: username);
      });

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMessage = 'The account already exists for that email.';
      } else {
        _errorMessage = 'An error occurred. Please try again.';
        log('Error:${e.code}******* ${e.message}');
      }
    } catch (error) {
      _errorMessage = 'An error occurred. Please try again.';
      log('Error: $error');
    }
    return _errorMessage;
  }
}
