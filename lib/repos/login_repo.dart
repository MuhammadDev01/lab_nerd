import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  String _errorMessage = '';
//**Login With Email and Password**\\
  Future<Either<String, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((userCredential) {
        return Right(userCredential.user!);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _errorMessage = 'Account Not Found, Signup First';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'Wrong Password, Try Again';
      } else if (e.code == 'invalid-credential') {
        _errorMessage = 'Email or Password is incorrect';
      } else {
        _errorMessage = e.code;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }
    return Left(_errorMessage);
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
