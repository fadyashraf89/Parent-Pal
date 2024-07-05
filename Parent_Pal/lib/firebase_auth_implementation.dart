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

Future<User?> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch(e){
      print("Some Error occured");
    }
    return null;
  }
}