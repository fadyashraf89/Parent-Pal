import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _selectedGender = 'Male';
  String _selectedStatus = 'Married';
  bool _isConsultant = false;

  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _licenseImage; // Variable to store the picked image file

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future<void> _pickImage(ImageSource source) async {
      try {
        final pickedFile = await ImagePicker().pickImage(
          source: source,
          maxWidth: 800, // Optional, set maximum width for image
          imageQuality: 80, // Optional, reduce image quality
        );
        if (pickedFile != null) {
          setState(() {
            _licenseImage = File(pickedFile.path);
          });
        }
      } catch (e) {
        print('Error picking image: $e');
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/parent.png',
                  width: screenWidth * 0.5, // 50% of screen width
                  height: screenHeight * 0.3, // 30% of screen height
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
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
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
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
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
                  onPressed: () {
                    // Add sign up functionality here based on role
                    String firstName = _firstNameController.text;
                    String lastName = _lastNameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    String gender = _selectedGender;
                    String status = _selectedStatus;
                    File? licenseImage = _licenseImage;

                    // Implement your sign-up logic here
                    if (_isConsultant) {
                      // Consultant sign-up logic
                      // Validate fields and handle image upload
                      if (licenseImage != null) {
                        // Handle image upload or processing
                      }
                    } else {
                      // Normal sign-up logic
                      // Validate fields
                    }
                  },
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
                    Navigator.pushNamed(context, '/login');
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

void main() => runApp(MaterialApp(
  home: SignUpPage(),
));
