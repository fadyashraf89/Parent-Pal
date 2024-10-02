import 'package:flutter/material.dart';
import 'package:parent_pal/pages/auth_session.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool hasBeenInitialized = await Firebase.initializeApp().then((_) => true).catchError((_) => false);

  if (!hasBeenInitialized) {
    // Initialize Firebase if it hasn't been done yet
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD5Su9Zn-K7TfauGrSUrcOY3lAHtN-fRnA",
        authDomain: "parent-pal-f9258.firebaseapp.com",
        projectId: "parent-pal-f9258",
        storageBucket: "parent-pal-f9258.appspot.com",
        messagingSenderId: "675045068250",
        appId: "1:675045068250:web:8ea5970d1c5f5f3872c4e3",
      ),
    );
  }

  runApp(const ParentPal());
}
class ParentPal extends StatelessWidget {
  const ParentPal({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthCheck(), // Check auth state
    );

  }
}
