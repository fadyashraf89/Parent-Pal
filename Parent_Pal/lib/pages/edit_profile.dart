import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final void Function(String) updateNameCallback;

  ProfilePage({Key? key, required this.updateNameCallback}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  User? _currentUser;
  Map<String, dynamic> _userData = {};
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? _profileImagePath;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      DocumentSnapshot userDoc =
      await _firestore.collection('users').doc(_currentUser!.uid).get();
      _userData = userDoc.data() as Map<String, dynamic>;
      _firstNameController.text = _userData['firstName'] ?? '';
      _lastNameController.text = _userData['lastName'] ?? '';
      _emailController.text = _userData['email'] ?? _currentUser!.email!;
      _profileImagePath = _userData['profileImage'];
      setState(() {});
    }
  }

  Future<void> _updateUserData() async {
    if (_currentUser != null) {
      await _firestore.collection('users').doc(_currentUser!.uid).update({
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'email': _emailController.text.trim(),
        'profileImage': _profileImagePath,
      });
      // Update email in Firebase Auth
      await _currentUser!.updateEmail(_emailController.text.trim());
      widget.updateNameCallback(
          '${_firstNameController.text} ${_lastNameController.text}');
      setState(() {
        _userData['firstName'] = _firstNameController.text.trim();
        _userData['lastName'] = _lastNameController.text.trim();
        _userData['email'] = _emailController.text.trim();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _updateProfilePicture(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      // Upload image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${_currentUser!.uid}.jpg');
      UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        _profileImagePath = imageUrl;
      });
    }
  }

  Future<void> _updatePassword(String newPassword) async {
    try {
      await _currentUser!.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password updated successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update password: $e'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Edit Profile",
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

      body: _currentUser != null
          ? SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: _profileImagePath != null
                      ? ( _profileImagePath!.startsWith('assets/')
                      ? Image.asset(
                    _profileImagePath!,
                    width: 50.0, // Adjust image width as needed
                    height: 50.0, // Adjust image height as needed
                    fit: BoxFit.cover, // Ensure image fills the container
                  )
                      : Image.file(
                    File(_profileImagePath!),
                    width: 50.0, // Adjust image width as needed
                    height: 50.0, // Adjust image height as needed
                    fit: BoxFit.cover, // Ensure image fills the container
                  ))
                      : Icon(Icons.person, size: 50.0), // Fallback to icon
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_firstNameController.text} ${_lastNameController.text}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _userData['email'] ?? '',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showChangePasswordDialog();
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUserData,
              child: Text('Save Changes'),
            ),
          ],
        ),
      )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog();
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ClipOval(
                    child: _profileImagePath != null
                        ? (_profileImagePath!.startsWith('assets/')
                        ? Image.asset(
                      _profileImagePath!,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    )
                        : Image.network(
                      _profileImagePath!,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ))
                        : Icon(Icons.person, size: 50.0),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_firstNameController.text} ${_lastNameController.text}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _userData['email'] ?? '',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _showChangePasswordDialog();
                },
                child: Text('Change Password'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _updateUserData();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog() {
    String newPassword = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newPassword = value;
                },
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _updatePassword(newPassword);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}