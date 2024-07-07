import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parent_pal/pages/child_homepage.dart'; // Your home page for child
import 'package:parent_pal/pages/consultant_home_page.dart';
import 'package:parent_pal/pages/pregnant_home_page.dart';
import 'package:parent_pal/pages/login_page.dart'; // Your login page

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          // User is logged in, fetch user data from Firestore
          String uid = snapshot.data!.uid;
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(body: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasData && snapshot.data!.exists) {
                Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
                bool isPregnant = userData['isPregnant'] ?? false;
                bool isConsultant = userData['isConsultant'] ?? false;
                String firstName = userData['firstName'] ?? '';
                String lastName = userData['lastName'] ?? '';
                String name = '$firstName $lastName';
                String image = userData['profileImage'] ?? '';

                if (isPregnant) {
                  return PregnantHomePage(
                    name: name,
                  );
                } else if (isConsultant) {
                  return ConsultantHomePage();
                } else {
                  return ChildHomePage(
                    name: name,
                    image: image.isNotEmpty ? image : null,
                  );
                }
              } else {
                // User data not found in Firestore
                print('User data not found in Firestore');
                return LoginPage();
              }
            },
          );
        } else {
          // User is not logged in
          print('User is not logged in');
          return LoginPage();
        }
      },
    );
  }
}
