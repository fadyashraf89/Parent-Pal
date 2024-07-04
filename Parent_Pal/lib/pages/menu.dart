import 'package:flutter/material.dart';
import 'about.dart';
import 'settings.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
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
              SizedBox(height: 20),
              // Settings button
              _buildMenuButton(
                context,
                icon: Icons.settings,
                label: 'Settings',
                onTap: () {
                  // Navigate to settings page or handle settings action
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => settings()),
                  );
                },
              ),
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
                onTap: () {
                  // Handle log out action
                  Navigator.pushReplacementNamed(context, '/login');
                },
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
