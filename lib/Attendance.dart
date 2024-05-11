import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Page'),
        backgroundColor: mainColor,
      ),
      body: Container(
        color: secondaryColor,
        child: Attendance(),
      ),
    );
  }
}

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final List<Map<String, String>> attendanceData = [
    {'week': 'Week 12', 'date': '18th April', 'technical': 'Absent', 'domain': 'Absent', 'weeklyAttendance': '33.33'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
    {'week': 'Week 11', 'date': '16th April', 'technical': 'Present', 'domain': 'Present', 'weeklyAttendance': '100'},
  ];

  // Current view state
  bool isTechnicalSelected = false;
  bool isDomainSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CardView(
              title: 'Attendance',
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CheckboxButton(
                    label: 'Technical',
                    isSelected: isTechnicalSelected,
                    onSelected: (value) {
                      setState(() {
                        isTechnicalSelected = value;
                      });
                    },
                  ),
                  CheckboxButton(
                    label: 'Domain',
                    isSelected: isDomainSelected,
                    onSelected: (value) {
                      setState(() {
                        isDomainSelected = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          // Attendance table (conditionally visible)
          if (isTechnicalSelected || isDomainSelected)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CardView(
                title: 'Attendance Table',
                content: DataTable(
                  columnSpacing: 24.0,
                  columns: [
                    DataColumn(label: Text('Week', style: TextStyle(fontWeight: FontWeight.bold, color: thirdColor))),
                    DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold, color: thirdColor))),
                    if (isTechnicalSelected) DataColumn(label: Text('Technical', style: TextStyle(fontWeight: FontWeight.bold, color: thirdColor))),
                    if (isDomainSelected) DataColumn(label: Text('Domain', style: TextStyle(fontWeight: FontWeight.bold, color: thirdColor))),
                    DataColumn(label: Text('Weeklyatt', style: TextStyle(fontWeight: FontWeight.bold, color: thirdColor))),
                  ],
                  rows: attendanceData.map((data) {
                    return DataRow(cells: [
                      DataCell(Text(data['week'] ?? '', style: TextStyle(color: fourthColor))),
                      DataCell(Text(data['date'] ?? '', style: TextStyle(color: fourthColor))),
                      if (isTechnicalSelected) DataCell(Text(data['technical'] ?? '', style: TextStyle(color: fourthColor))),
                      if (isDomainSelected) DataCell(Text(data['domain'] ?? '', style: TextStyle(color: fourthColor))),
                      DataCell(Text(data['weeklyAttendance'] ?? '', style: TextStyle(color: fourthColor))),
                    ]);
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final String title;
  final Widget content;

  const CardView({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: secondaryColor,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            content,
          ],
        ),
      ),
    );
  }
}

class CheckboxButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const CheckboxButton({required this.label, required this.isSelected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onSelected(!isSelected);
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.lightBlue[200] : Colors.white,
        textStyle: TextStyle(color: isSelected ? Colors.black : Colors.white),
      ),
    );
  }
}

const Color mainColor = Color(0xff6a6446);
const Color secondaryColor = Color(0xfff2f0e4);
const Color thirdColor = Color(0xff403a1f);
const Color fourthColor = Color(0xffbf7d2c);
