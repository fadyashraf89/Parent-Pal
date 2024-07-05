import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _currentUser;
  List<ChildData> _children = [];

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _getChildrenData();
  }

  Future<void> _getCurrentUser() async {
    _currentUser = await _auth.currentUser;
    setState(() {});
  }

  Future<void> _getChildrenData() async {
    if (_currentUser != null) {
      // Replace 'users' with your actual collection name for users
      CollectionReference usersRef = _firestore.collection('users');
      DocumentReference userDocRef = usersRef.doc(_currentUser!.uid);
      // Replace 'children' with the field name storing children data
      QuerySnapshot childrenSnapshot = await userDocRef.collection('children').get();
      _children = childrenSnapshot.docs.map((doc) => ChildData.fromDocument(doc)).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _currentUser != null
          ? SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Display user data (name, email, etc.) from _currentUser
            Text(
              '${_currentUser!.displayName ?? _currentUser!.email}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Additional user data fields (optional)
            // Text('Additional user data'),
            SizedBox(height: 20),
            Text(
              'Children:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _children.isEmpty
                ? Text('No children added yet')
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _children.length,
              itemBuilder: (context, index) {
                ChildData child = _children[index];
                return Card(
                  child: ListTile(
                    title: Text(child.name),
                    subtitle: Text('Birthday: ${child.birthday}'),
                  ),
                );
              },
            ),
          ],
        ),
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class ChildData {
  final String name;
  final String birthday;

  ChildData({required this.name, required this.birthday});

  factory ChildData.fromDocument(DocumentSnapshot doc) {
    return ChildData(
      name: doc['name'] ?? '',
      birthday: doc['birthday'] ?? '',
    );
  }
}
