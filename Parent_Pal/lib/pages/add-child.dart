import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "Add Child"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        gradient: LinearGradient(
                          colors: [Colors.blue[100]!, Colors.pink[100]!],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      height: 200,
                      width: 200,
                      child: _selectedImage == null
                          ? Center(child: Icon(Icons.person, size: 100, color: Colors.white))
                          : ClipOval(
                              child: Image.file(
                                _selectedImage!,
                                width: screenWidth * 0.5, // 50% of screen width
                                height: screenHeight * 0.3, // 30% of screen height
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SafeArea(
                                  child: Wrap(
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
                                        leading: Icon(Icons.photo_camera, color: Color(0xFF5571A7),),
                                        title: Text('Camera'),
                                        onTap: () {
                                          _pickImage(ImageSource.camera);
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(Icons.camera_alt, color: Color(0xFF5571A7)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Full Name',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Color(0xFF5571A7)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5571A7)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    hintText: 'MM / DD / YYYY',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Color(0xFF5571A7)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5571A7)),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        focusColor: Color(0xFF5571A7),
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
                          labelStyle: TextStyle(color: Colors.blue),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
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
                          labelStyle: TextStyle(color: Colors.blue),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle the Add button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5571A7),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
