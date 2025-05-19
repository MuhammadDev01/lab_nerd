import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  static String _errorMessage = '';
  Future<Either<String, User>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateProfile(displayName: username);
      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMessage = 'The account already exists for that email.';
      } else {
        _errorMessage = 'An error occurred. Please try again.';
      }
      log('Error: ${e.code}');
    } catch (error) {
      _errorMessage = 'An error occurred. Please try again.';
      log('Error: $error');
    }
    return Left(_errorMessage);
  }
}
