import 'package:flutter/material.dart';
import 'package:parent_pal/pages/menu.dart';

class MyAppBar extends StatelessWidget {
  final String PageName; // Use lowercase for consistency
  const MyAppBar({super.key, required this.PageName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF5571A7),
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          PageName,
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
      actions: [
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Navigate to MenuPage here
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()));
          },
        ),
      ],
    );
  }
}
