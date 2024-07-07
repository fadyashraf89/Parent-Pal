import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthen {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            throw 'The email address is not valid.';
          case 'user-disabled':
            throw 'This user has been disabled.';
          case 'user-not-found':
            throw 'No user found with this email.';
          case 'wrong-password':
            throw 'The password is incorrect. Please try again.';
          case 'network-request-failed':
            throw 'Network error. Please check your connection and try again.';
          default:
            throw 'Firebase error: ${e.code} - ${e.message}';
        }
      } else {
        throw 'An unexpected error occurred: ${e.toString()}';
      }
    }
  }

}