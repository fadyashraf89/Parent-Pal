import 'package:flutter/material.dart';
// import 'package:parent_pal/pages/QAConsultantPage.dart';
import 'package:parent_pal/pages/bedtime_stories_page.dart';
import 'package:parent_pal/pages/consultant_home_page.dart';
import 'package:parent_pal/pages/edit_child_info_page.dart';
import 'package:parent_pal/pages/login_page.dart';
import 'package:parent_pal/pages/consultation-page.dart';
import 'package:parent_pal/pages/sign-up.dart';

void main() {
  runApp(const ParentPal());
}

class ParentPal extends StatelessWidget {
  const ParentPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginPage()
      // home: ConsultantHomePage()
      // home: ChildInfo()
      home: ConsultationPage()
      // home: SignUpPage()
      // home: ChildHomePage(name: "fady",age: 13,image: 'assets/images/fido.png',)
    );
  }
}