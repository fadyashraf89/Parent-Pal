import 'package:flutter/material.dart';
import 'package:parent_pal/models/school_info.dart';

class SchoolDetailsScreen extends StatelessWidget {
  final SchoolInfo school;

  const SchoolDetailsScreen({Key? key, required this.school}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(school.name!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display school image (if available)
              Image.network(
                school.imageUrl ??
                    "https://via.placeholder.com/150", // Placeholder image
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
              Text(
                "Address:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(school.address ?? ""),
              const SizedBox(height: 16.0),
              Text(
                "Description:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(school.description ?? "No description available"),
              const SizedBox(height: 16.0),

            ],
          ),
        ),
      ),
    );
  }
}