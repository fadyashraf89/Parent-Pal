import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User profile image container
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue[100]!, Colors.pink[100]!],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // User name
              Text(
                'Adham',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // User email
              Text(
                'adham@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              // Edit Profile button
              _buildSettingsButton(
                context,
                icon: Icons.edit,
                label: 'Edit Profile',
                onTap: () {
                  // Navigate to Edit Profile page
                },
              ),
              SizedBox(height: 10),
              // Delete Account button
              _buildSettingsButton(
                context,
                icon: Icons.delete,
                label: 'Delete Account',
                onTap: () {
                  // Navigate to Delete Account page or show a confirmation dialog
                },
              ),
              SizedBox(height: 10),
              // Change Password button
              _buildSettingsButton(
                context,
                icon: Icons.lock,
                label: 'Change Password',
                onTap: () {
                  // Navigate to Change Password page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a settings button
  Widget _buildSettingsButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
          ],
        ),
      ),
    );
  }
}
