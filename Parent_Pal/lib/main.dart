import 'package:flutter/material.dart';
import 'package:parent_pal/pages/bedtime_stories_page.dart';
import 'package:parent_pal/pages/edit_child_info_page.dart';
import 'package:parent_pal/pages/login_page.dart';
import 'package:parent_pal/pages/consultation-page.dart';

void main() {
  runApp(const ParentPal());
}

class ParentPal extends StatelessWidget {
  const ParentPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: ConsultationPage()
        // home: StoryListPage()
        home: ChildInfo()
        // home: ConsultationPage()
    //     home: ConsultationPage()

    );
  }
}