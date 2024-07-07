import 'dart:io';
import 'package:parent_pal/firebase_auth_implementation.dart'; // Adjust path as per your project structure
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parent_pal/pages/child_homepage.dart';
import 'package:parent_pal/pages/consultant_home_page.dart';
import 'package:parent_pal/pages/login_page.dart';
import 'package:parent_pal/pages/pregnant_home_page.dart';
import 'package:crypto/crypto.dart'; // Add this for hashing
import 'dart:convert'; // Ensure this import is correct

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _selectedGender = 'Male';
  String _selectedStatus = 'Married';
  bool _isConsultant = false;
  bool _isPregnant = false;
  final FirebaseAuthen _auth = FirebaseAuthen();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firestore instance
  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _consultantPasswordController = TextEditingController(); // Controller for consultant password
  File? _licenseImage; // Variable to store the picked image file
  File? _profileImage; // Variable to store the profile image file
  bool _isObscure = true; // Initial state is password obscured
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _consultantPasswordController.dispose(); // Dispose consultant password controller
    super.dispose();
  }

  void handleSignUp() async {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String gender = _selectedGender;
    String status = _selectedStatus;

    // Generate hashed password
    String password = _passwordController.text.trim();
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();

    // Additional hashed password for consultant
    String consultantPassword = _consultantPasswordController.text.trim();
    String hashedConsultantPassword = sha256.convert(utf8.encode(consultantPassword)).toString();

    if (email.isEmpty || (password.isEmpty && !_isConsultant)) {
      _showSnackbar("Email and password cannot be empty");
      return;
    }

    try {
      User? user;
      if (_isConsultant) {
        // Sign up as consultant with consultant password
        user = await _auth.signUpWithEmailAndPassword(email, hashedConsultantPassword);
      } else {
        // Sign up as regular user with normal password
        user = await _auth.signUpWithEmailAndPassword(email, hashedPassword);
      }

      if (user != null) {
        print("User created successfully");

        // Store user data in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': hashedPassword,
          'gender': gender,
          'status': _isConsultant ? null : status,
          'isConsultant': _isConsultant,
          'isPregnant': _isPregnant,
          'licenseImage': _licenseImage != null ? _licenseImage!.path : null,
          'profileImage': _profileImage != null ? _profileImage!.path : null,
        });

        // Navigate based on gender and pregnancy status
        if (gender == 'Female' && _isPregnant) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PregnantHomePage(
                name: '$firstName $lastName',
              ),
            ),
          );
        } else if (_isConsultant){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ConsultantHomePage(),
            ),
          );
        }
        else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChildHomePage(
                name: '$firstName $lastName',
                image: _profileImage != null ? _profileImage!.path : null,
              ),
            ),
          );
        }
      }
    } catch (e) {
      print("Error: $e");
      _showSnackbar("Error: $e");
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800, // Optional, set maximum width for image
        imageQuality: 80, // Optional, reduce image quality
      );
      if (pickedFile != null) {
        setState(() {
          if (_isConsultant) {
            _licenseImage = File(pickedFile.path);
          } else {
            _profileImage = File(pickedFile.path);
          }
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showSnackbar(String message) {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/images/app-logo.png",
            width: 50,
            height: 50,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_isConsultant)
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.photo_library, color: Color(0xFF5571A7)),
                                title: Text('Gallery'),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.photo_camera, color: Color(0xFF5571A7)),
                                title: Text('Camera'),
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                      child: _profileImage == null ? Icon(Icons.camera_alt, size: 24, color: Color(0xFF5571A7)) : null,
                    ),
                  ),
                if (_isConsultant)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Please attach your practice license to proceed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        child: Text('Pick Image from Gallery'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _pickImage(ImageSource.camera),
                        child: Text('Take a Picture'),
                      ),
                      SizedBox(height: 10),
                      _licenseImage != null
                          ? Image.file(
                        _licenseImage!,
                        height: 150,
                      )
                          : Container(),
                    ],
                  ),
                SizedBox(height: 10),
                TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                if (!_isConsultant)
                  TextField(
                    controller: _passwordController,
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
                if (_isConsultant)
                  TextField(
                    controller: _consultantPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Consultant Password',
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
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue ?? 'Male';
                      if (_selectedGender == 'Female') {
                        _isPregnant = false; // Reset pregnancy status when switching to female
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
                if (_selectedGender == 'Female' && !_isConsultant)
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Text('Are you pregnant?'),
                        value: _isPregnant,
                        onChanged: (bool? value) {
                          setState(() {
                            _isPregnant = value ?? false;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                if (!_isConsultant)
                  SizedBox(height: 10),
                if (!_isConsultant)
                  DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    items: ['Single', 'Married', 'Divorced', 'Widowed'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedStatus = newValue ?? 'Single';
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                  ),
                SizedBox(height: 10),
                CheckboxListTile(
                  title: Text('Sign up as Consultant'),
                  value: _isConsultant,
                  onChanged: (bool? value) {
                    setState(() {
                      _isConsultant = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5571A7),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())); // Replace with actual screen
                  },
                  child: Text(
                    "Already have an account? Login",
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
}
