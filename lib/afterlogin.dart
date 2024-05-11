import 'package:flutter/material.dart';
import 'package:ui/Alumini.dart';
import 'package:ui/Attendance.dart';
import 'package:ui/CompanyFeedback.dart';
import 'package:ui/ContactSupport.dart';
import 'package:ui/Events.dart';
import 'package:ui/PlacementCorner.dart';
import 'package:ui/RevisionMaterial.dart';
import 'package:ui/Settings.dart';
import 'package:ui/StudentFeedback.dart';
import 'package:ui/mypractice.dart';
import 'package:ui/performance.dart';

import 'Homepage.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Page'),
        backgroundColor: mainColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.logout),
            onPressed: () {

            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              // Adjust the height as needed
              decoration: BoxDecoration(
                color: mainColor,

              ),
              child: const Center(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),
            ),
            ListTile(
              title: const Text('Attendance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendancePage()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),
            ),
            ListTile(
              title: const Text('My Performance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerformanceScreen()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),),
            ListTile(
              title: const Text('My Practice'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPracticeScreen()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),),
            ListTile(
              title: const Text('Alumini Repository'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlumniScreen()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),),
            ListTile(
              title: const Text('Revision Material'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterUser()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),
            ),
            ListTile(
              title: const Text('Placement Corner'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardExample()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),
            ),
            ListTile(
              title: const Text('Student feedback to mentor'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),
            ),
            ListTile(
              title: const Text('Company Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompanyFeedback()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),
            ),
            ListTile(
              title: const Text('Placement Policy'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactAndSupportScreen()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),
            ),
            ListTile(
              title: const Text('Events'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventPage()),
                );
              },
              hoverColor: thirdColor.withOpacity(0.5),

            ),
        ListTile(
          title: const Text('Settings'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settings()),
            );
          },
          hoverColor: thirdColor.withOpacity(0.5),),

          ],

        ),

      ),

      body: Container(
        color: secondaryColor,
        child: HomePage(),
      ),
    );
  }
}
class MotivationalQuoteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Motivational Quote',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: fourthColor,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '"You are braver than you believe, stronger than you seem, and smarter than you think."',
                style: TextStyle(fontSize: 16, color: thirdColor),
              ),
              SizedBox(height: 8),
              Text(
                'Remember, your hard work will pay off!',
                style: TextStyle(fontSize: 16, color: thirdColor),
              ),
              SizedBox(height: 8),
              Text(
                'Placements are crucial for your future. Stay motivated!',
                style: TextStyle(fontSize: 16, color: thirdColor),
              ),
              SizedBox(height: 8),
              Text(
                'You are eligible for placements.',
                style: TextStyle(fontSize: 16, color: thirdColor),
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
