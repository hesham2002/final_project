import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helper/assistant_provider.dart';
import 'patient_list_screen.dart';

class AssistantProfilePage extends StatefulWidget {
  @override
  State<AssistantProfilePage> createState() => _AssistantProfilePageState();
}

class _AssistantProfilePageState extends State<AssistantProfilePage> {
  @override
  Widget build(BuildContext context) {
    final assistantProvider = Provider.of<AssistantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        title: Text('Assistant Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(assistantProvider.imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              assistantProvider.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Assistant to ${assistantProvider.doctorName}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () async {
                final date = await _selectDate(context);
                if (date != null) {
                  final description = await _showInputDialog(context, 'Enter Schedule Description');
                  if (description != null) {
                    assistantProvider.addSchedule(date, description);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Schedule added')),
                    );
                  }
                }
              },
              icon: Icon(FontAwesomeIcons.calendarPlus),
              label: Text('Add Schedule'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 30, 84), // Button background color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final patientName = await _showInputDialog(context, 'Enter Patient Name');
                if (patientName != null) {
                  final date = await _selectDate(context);
                  if (date != null) {
                    assistantProvider.reserveAppointment(patientName, date);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Appointment reserved')),
                    );
                  }
                }
              },
              icon: Icon(FontAwesomeIcons.calendarCheck),
              label: Text('Reserve Appointment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 30, 84), // Button background color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientListScreen()),
                );
              },
              icon: Icon(FontAwesomeIcons.comments),
              label: Text('Chat with Patients'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 30, 84), // Button background color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    return picked;
  }

  Future<String?> _showInputDialog(BuildContext context, String title) async {
    String input = '';
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            onChanged: (value) {
              input = value;
            },
            decoration: InputDecoration(hintText: "Enter here"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(input);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 30, 84), // Button background color
              ),
            ),
          ],
        );
      },
    );
  }
}
