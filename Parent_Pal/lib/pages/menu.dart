import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/pages/login_page.dart';
import 'about.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              // About ParentPal button
              _buildMenuButton(
                context,
                icon: Icons.info,
                label: 'About ParentPal',
                onTap: () {
                  // Navigate to about page or handle info action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutParentPal()),
                  );
                },
              ),
              SizedBox(height: 10),
              // Logout button
              _buildMenuButton(
                context,
                icon: Icons.logout,
                label: 'Log out',
                onTap: () => handleLogout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a menu button
  Widget _buildMenuButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
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

void handleLogout(BuildContext context) async {
  // Get shared preferences instance
  final prefs = await SharedPreferences.getInstance();

  // Clear user data (adapt based on your app's data)
  await prefs.clear();  // This clears all stored data, adjust if needed

  // Navigate to login page (replace with your actual login page)
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

