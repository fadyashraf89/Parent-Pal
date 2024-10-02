import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QAPage extends StatefulWidget {
  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  Map<String, TextEditingController> answerControllers = {};

  @override
  void initState() {
    super.initState();
    fetchQuestions(); // Fetch questions when widget initializes
  }

  Future<void> fetchQuestions() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('questions').get();

      // Initialize answerControllers for each question
      answerControllers = Map.fromIterable(
        querySnapshot.docs,
        key: (doc) => doc.id,
        value: (doc) => TextEditingController(),
      );

      setState(() {}); // Update UI after fetching questions
    } catch (e) {
      print('Error fetching questions: $e');
    }
  }

  void _submitAnswer(String questionId) async {
    String answer = answerControllers[questionId]!.text.trim();

    if (answer.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('questions')
            .doc(questionId)
            .collection('answers')
            .add({
          'answer': answer,
          'answeredBy': FirebaseAuth.instance.currentUser!.uid,
          'date': DateTime.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Answer submitted successfully')),
        );

        // Clear answer text field after submission
        answerControllers[questionId]!.clear();
      } catch (e) {
        print('Error submitting answer: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit answer')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Q&A",
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
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('questions').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No questions found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot questionDoc = snapshot.data!.docs[index];
                String questionId = questionDoc.id;
                String questionText = questionDoc['question'];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            questionText,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('questions')
                                .doc(questionId)
                                .collection('answers')
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                                List<String> answers = snapshot.data!.docs
                                    .map((doc) => doc['answer'].toString())
                                    .toList();

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: answers.map((answer) {
                                    return Text(
                                      '- $answer',
                                      style: TextStyle(color: Colors.black),
                                    );
                                  }).toList(),
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: answerControllers[questionId],
                            decoration: InputDecoration(
                              hintText: 'Type your answer here...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => _submitAnswer(questionId),
                            child: Text('Submit Answer'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
