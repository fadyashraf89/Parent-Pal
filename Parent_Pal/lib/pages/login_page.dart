import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parent_pal/pages/forgot-pass.dart';
import 'package:parent_pal/pages/sign-up.dart';
import './pregnant_home_page.dart';
import './child_homepage.dart';
import 'package:crypto/crypto.dart'; // Add this for hashing
import 'dart:convert'; // Ensure this import is correct

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app-logo.png',
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.3,
                ),
                SizedBox(height: 20),
                Text(
                  'Parent Pal',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5571A7),
                  ),
                ),
                SizedBox(height: 35),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  obscureText: _isObscure,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5571A7),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())); // Replace with actual screen
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();

    if (email.isEmpty || hashedPassword.isEmpty) {
      _showSnackBar('Email or password cannot be empty', Colors.red);
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: hashedPassword,
      );

      User? user = userCredential.user;
      if (user != null) {
        // User authenticated successfully
        print('Login successful for user: ${user.uid}');
        _showSnackBar('Login successful', Colors.green);

        // Check user details in Firestore
        DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (snapshot.exists) {
          // Extract first name from user data
          String firstName = snapshot.data()?['firstName'] ?? '';
          String lastName = snapshot.data()?['lastName'] ?? '';
          String fullName = firstName + " " + lastName;

          String? profileImage = snapshot.data()?['profileImage'];
          if (profileImage == null) {
            profileImage = 'assets/images/avatar.png';
          }

          String gender = snapshot.data()?['gender'];
          bool isPregnant = snapshot.data()?['isPregnant'] ?? false;

          if (isPregnant) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PregnantHomePage(name: fullName)),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChildHomePage(name: fullName, image: profileImage)),
            );
          }
        } else {
          print('User document does not exist in Firestore');
          _showSnackBar('User data not found', Colors.red);
        }
      } else {
        print('User object is null');
        _showSnackBar('Login failed, user is null', Colors.red);
      }
    } catch (e) {
      // Handle specific authentication errors
      print('Login failed with error: $e');
      String errorMessage = 'Login failed. Please check your email and password.';
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found with this email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for this user.';
        }
      }
      _showSnackBar(errorMessage, Colors.red);
    }
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
