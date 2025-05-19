import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
//**Login With Email and Password**\\
  static Future<Either<String, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left("Account Not Found, Signup First");
      } else if (e.code == 'wrong-password') {
        return Left("Wrong Password, Try Again");
      } else if (e.code == 'invalid-credential') {
        return Left("Email or Password is incorrect");
      } else {
        log('Error: ${e.code}');
        return Left("Error: ${e.code}");
      }
    } catch (e) {
      log('Error: ${e.toString()}');
      return Left("Error: ${e.toString()}");
    }
  }

  //  Future<UserCredential> loginWithFirebaseGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     ret_errorMessage = e.toString();urn Future.error('Failed to sign in with Google: $e');
  //   }
  // }
}
