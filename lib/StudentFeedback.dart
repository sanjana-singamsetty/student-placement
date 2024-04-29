import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String? selectedTeacher;
  List<String> teachers = ['Murali', 'Krishna', 'Akhila', 'Cherish Laxman'];

  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Screen'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Teacher',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Teacher',
                  border: OutlineInputBorder(),
                ),
                value: selectedTeacher,
                items: teachers.map((teacher) {
                  return DropdownMenuItem<String>(
                    value: teacher,
                    child: Text(teacher),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTeacher = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: feedbackController,
                decoration: InputDecoration(
                  labelText: 'Enter Feedback',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity, // Set the width to match the parent
                height: 50, // Set the desired height
                child: ElevatedButton(
                  onPressed: () {
                    // Add logic to submit feedback
                    print('Selected Teacher: $selectedTeacher');
                    print('Feedback: ${feedbackController.text}');
                    // Clear input fields after submitting feedback
                    setState(() {
                      selectedTeacher = null;
                      feedbackController.clear();
                    });
                  },
                  child: Text(
                    'Submit Feedback',
                    style: TextStyle(
                      color: Colors.white, // Set the font color to white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const Color mainColor = Color(0xff6a6446);
const Color secondaryColor = Color(0xfff2f0e4);
const Color thirdColor = Color(0xff403a1f);
const Color fourthColor = Color(0xffbf7d2c);
