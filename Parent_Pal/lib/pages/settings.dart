import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "Settings"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // Bottom shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFF5571A7)),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5571A7),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,color: Color(0xFF5571A7), size: 16, ),
            ],
          ),
        ),
      ),
    );
  }
}