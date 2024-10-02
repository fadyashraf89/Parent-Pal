import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:parent_pal/models/MyAppBar.dart';

class AddChildPage extends StatefulWidget {
  @override
  _AddChildPageState createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  String _selectedGender = 'Gender';
  String _selectedSpecialNeed = 'Special needs';
  File? _selectedImage;
  bool _isPregnant = false;

  final ImagePicker _picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  List<ChildData> _children = []; // List to store children data

  @override
  void initState() {
    super.initState();
    _getChildrenData();
  }

  Future<void> _getChildrenData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;

        // Fetch children data from Firestore where parentId equals current user's UID
        QuerySnapshot snapshot =
        await _firestore.collection('children').where('parentId', isEqualTo: uid).get();

        // Convert each document to ChildData object and store in _children list
        List<ChildData> children = snapshot.docs.map((doc) {
          return ChildData.fromDocument(doc);
        }).toList();

        // Update UI with fetched children data
        setState(() {
          _children = children;
        });
      }
    } catch (e) {
      print('Error fetching children data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch children data. Please try again later.'),
        ),
      );
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _addChildToFirebase() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;

        // Upload image if selected
        String? imageUrl;
        if (_selectedImage != null) {
          Reference storageReference = FirebaseStorage.instance
              .ref()
              .child('images')
              .child('$uid-${DateTime.now().millisecondsSinceEpoch}');
          UploadTask uploadTask = storageReference.putFile(_selectedImage!);
          TaskSnapshot taskSnapshot = await uploadTask;
          imageUrl = await taskSnapshot.ref.getDownloadURL();
        }

        // Add child data to Firestore under 'children' collection
        DocumentReference docRef = await _firestore.collection('children').add({
          'parentId': uid,
          'name': _nameController.text,
          'birthday': _birthdayController.text,
          'gender': _selectedGender,
          'specialNeed': _selectedSpecialNeed,
          'imageUrl': imageUrl, // Optional field for image URL
        });

        // Retrieve added child data
        DocumentSnapshot childDoc = await docRef.get();
        ChildData newChild = ChildData.fromDocument(childDoc);

        // Update UI with the new child data
        setState(() {
          _children.add(newChild);
        });

        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Child added successfully')),
        );
      }
    } catch (e) {
      print('Error adding child: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add child. Please try again later.'),
        ),
      );
    }
  }

  Future<void> _updateChildInFirebase(ChildData child) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;

        // Update child data in Firestore
        await _firestore.collection('children').doc(child.id).update({
          'name': _nameController.text,
          'birthday': _birthdayController.text,
          'gender': _selectedGender,
          'specialNeed': _selectedSpecialNeed,
          // Optionally, update imageUrl if needed
        });

        // Update UI with updated child data
        setState(() {
          child.name = _nameController.text;
          child.birthday = _birthdayController.text;
          child.gender = _selectedGender;
          child.specialNeeds = _selectedSpecialNeed;
          // Optionally, update imageUrl in child object
        });

        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Child updated successfully')),
        );
      }
    } catch (e) {
      print('Error updating child: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update child. Please try again later.'),
        ),
      );
    }
  }

  Future<void> _deleteChildFromFirebase(ChildData child) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Delete child document from Firestore
        await _firestore.collection('children').doc(child.id).delete();

        // Update UI by removing the deleted child from _children list
        setState(() {
          _children.remove(child);
        });

        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Child deleted successfully')),
        );
      }
    } catch (e) {
      print('Error deleting child: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete child. Please try again later.'),
        ),
      );
    }
  }

  ListView _buildChildrenList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _children.length,
      itemBuilder: (context, index) {
        ChildData child = _children[index];
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${child.name}'),
              Text('Birthday: ${child.birthday}'),
              Text('Gender: ${child.gender}'),
              Text('Special Needs: ${child.specialNeeds}'),
              if (child.imageUrl != null)
                Image.network(child.imageUrl!), // Display image if available
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _showEditChildDialog(child);
                    },
                    child: Text('Edit', style: TextStyle(color: Colors.blue)),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      _showDeleteConfirmationDialog(child);
                    },
                    child: Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showEditChildDialog(ChildData child) async {
    _nameController.text = child.name;
    _birthdayController.text = child.birthday;
    _selectedGender = child.gender;
    _selectedSpecialNeed = child.specialNeeds;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Child'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _birthdayController,
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    hintText: 'MM / DD / YYYY',
                  ),
                  keyboardType: TextInputType.datetime,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Gender', 'Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue!;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedSpecialNeed,
                  items: ['Special needs', 'None', 'Visual', 'Hearing', 'Mobility'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSpecialNeed = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
                _updateChildInFirebase(child);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteConfirmationDialog(ChildData child) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${child.name}?'),
          actions: <Widget>[
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                _deleteChildFromFirebase(child);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _birthdayController.text = pickedDate.toString(); // Update text field with selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Child'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _birthdayController,
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Gender', 'Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedSpecialNeed,
                  items: ['Special needs', 'None', 'Visual', 'Hearing', 'Mobility'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSpecialNeed = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addChildToFirebase,
                  child: Text('Add Child'),
                ),
                SizedBox(height: 20),
                _buildChildrenList(), // Display added children
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChildData {
  String id;
  String name;
  String birthday;
  String gender;
  String specialNeeds;
  String? imageUrl;
  String parentId; // Added field to store parent ID

  ChildData({
    required this.id,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.specialNeeds,
    this.imageUrl,
    required this.parentId, // Initialize with parent ID
  });

  factory ChildData.fromDocument(DocumentSnapshot doc) {
    return ChildData(
      id: doc.id,
      name: doc['name'] ?? '',
      birthday: doc['birthday'] ?? '',
      gender: doc['gender'] ?? '',
      specialNeeds: doc['specialNeed'] ?? '',
      imageUrl: doc['imageUrl'] ?? null,
      parentId: doc['parentId'] ?? '', // Initialize parent ID from Firestore
    );
  }
}
