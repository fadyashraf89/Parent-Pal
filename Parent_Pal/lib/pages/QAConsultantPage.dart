import 'package:flutter/material.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/pages/qa_consultant_details_page.dart';

class QAConsultantPage extends StatelessWidget {
  final List<Map<String, String>> qaData;

  QAConsultantPage({required this.qaData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'Q&A',
            style: TextStyle(
              fontSize: 28,
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
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: qaData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QADetailPage(
                      question: qaData[index]['question']!,
                      date: qaData[index]['date']!,
                      answer: qaData[index]['answer']!,
                      onAnswerSubmitted: (String newAnswer) {
                        // Update answer in qaData when submitted from QADetailPage
                        qaData[index]['answer'] = newAnswer;
                      },
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2), // Bottom shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      qaData[index]['question']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5571A7),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      qaData[index]['date']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
