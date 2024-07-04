import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this for DateFormat
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChildInfo extends StatefulWidget {
  @override
  _ChildInfoState createState() => _ChildInfoState();
}

class _ChildInfoState extends State<ChildInfo> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  DateTime? _birthday;
  String _gender = 'Gender';
  String _specialNeeds = 'Special needs';
  bool _isPregnant = false;
  File? _profileImage;

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _birthday) {
      setState(() {
        _birthday = picked;
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child info'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Profile picture section
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null
                        ? Icon(Icons.person, size: 50, color: Colors.grey[400])
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, size: 20, color: Colors.white),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: Text('Gallery'),
                                      onTap: () {
                                        _pickImage(ImageSource.gallery);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.photo_camera),
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
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Name field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Child's Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (!_isPregnant && (value == null || value.isEmpty)) {
                    return 'Please enter the child\'s name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 20),

              // Birthday field
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Child's Birthday",
                      hintText: 'MM / DD / YYYY',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                      text: _birthday == null
                          ? ''
                          : DateFormat('MM / dd / yyyy').format(_birthday!),
                    ),
                    validator: (value) {
                      if (!_isPregnant && _birthday == null) {
                        return 'Please select the child\'s birthday';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Gender and Special Needs dropdowns
              Row(
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _gender,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: <String>['Gender', 'Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _gender = newValue!;
                        });
                      },
                      validator: (value) {
                        if (!_isPregnant && value == 'Gender') {
                          return 'Please select a gender';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _specialNeeds,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: <String>[
                        'Special needs',
                        'Yes',
                        'No'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _specialNeeds = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Pregnancy checkbox
              CheckboxListTile(
                title: Text('I\'m pregnant'),
                value: _isPregnant,
                onChanged: (bool? value) {
                  setState(() {
                    _isPregnant = value!;
                    _formKey.currentState!.validate();
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 20),

              // Add button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save the information
                  }
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik",
                    color: Color(0xFF5571A7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
