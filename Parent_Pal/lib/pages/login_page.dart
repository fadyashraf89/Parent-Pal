import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text field controllers for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Color focusedColor = Color(0xFF5571A7); // Define focused border color
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Role selection
  String _selectedRole = 'Parent'; // Default role

  // Role selection
  String _selectedRole = 'Parent'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent the UI from resizing when the keyboard appears
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/app-logo.png",
                        width: 180,
                        height: 180,
                      ),
                      Text("Parent Pal",
                          style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 48,
                              color: Color(0xFF5571A7))),
                    ],
                  ),
                ),

                // Email text field with frame
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    style: TextStyle(fontFamily: "Rubik"),
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: focusedColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                  ),
                ),
                // Password text field with frame
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    style: TextStyle(fontFamily: "Rubik"),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: focusedColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                // Role selection dropdown
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: DropdownButtonFormField<String>(
                    value: _selectedRole,
                    items: ['Parent', 'Consultant'].map((String role) {
                      return DropdownMenuItem<String>(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRole = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Role',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: focusedColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle forgot password logic
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5571A7),
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0), // Add spacing between elements
                // Login button with full width
                ElevatedButton(
                  onPressed: () {
                    // Handle login logic based on role
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String role = _selectedRole;

                    // Implement your login logic here
                    // For example:
                    if (role == 'Parent') {
                      // Parent login logic
                    } else if (role == 'Consultant') {
                      // Consultant login logic
                    }
                  },
                  child:
                  Text('Login', style: TextStyle(fontFamily: "Pacifico", fontSize: 20,color:Colors.white)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xFF5571A7)),
                ),
                SizedBox(height: 20.0), // Add spacing between elements
                // Sign up section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Don\'t have an account?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Rubik")),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign up page
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold, fontFamily: "Rubik", color: Color(0xFF5571A7))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

