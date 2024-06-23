import 'package:flutter/material.dart';
import 'package:parent_pal/pages/login_page.dart';
import 'package:parent_pal/pages/emergencies_page.dart';
import 'package:parent_pal/pages/child_homepage.dart';


void main() {
  runApp(const ParentPal());
}

class ParentPal extends StatelessWidget {
  const ParentPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        name: "Fady Ashraf",
        age: 21,
        image: "assets/images/fido.png"
      )

    );
  }
}
