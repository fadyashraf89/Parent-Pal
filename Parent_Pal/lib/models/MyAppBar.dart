import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  final String PageName;
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
            fontSize: 26,
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
    );
  }
}
