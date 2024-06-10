import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helper/assistant_provider.dart';
import 'chat_part/patient_list_screen.dart';

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
        title: Text('Assistant\'s Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 30, 30, 84),
                    radius: 50,
                    child: Icon(Icons.person, color: Colors.white, size: 50),
                  ),
                ),
              ],
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
            _buildButton(
              onPressed: () => _addSchedule(context),
              icon: FontAwesomeIcons.calendarPlus,
              label: 'Add Schedule',
            ),
            SizedBox(height: 20),
            _buildButton(
              onPressed: () => _reserveAppointment(context),
              icon: FontAwesomeIcons.calendarCheck,
              label: 'Reserve Appointment',
            ),
            SizedBox(height: 20),
            _buildButton(
              onPressed: () => _navigateToChat(context),
              icon: FontAwesomeIcons.comments,
              label: 'Chat with Patients',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required VoidCallback onPressed, required IconData icon, required String label}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 30, 30, 84),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          textStyle: TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  void _addSchedule(BuildContext context) async {
    final date = await _selectDate(context);
    if (date != null) {
      final description = await _showInputDialog(context, 'Enter Schedule Description');
      if (description != null) {
        Provider.of<AssistantProvider>(context, listen: false).addSchedule(date, description);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Schedule added')),
        );
      }
    }
  }

  void _reserveAppointment(BuildContext context) async {
    final patientName = await _showInputDialog(context, 'Enter Patient Name');
    if (patientName != null) {
      final date = await _selectDate(context);
      if (date != null) {
        Provider.of<AssistantProvider>(context, listen: false).reserveAppointment(patientName, date);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Appointment reserved')),
        );
      }
    }
  }

  void _navigateToChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientChatList()),
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
                backgroundColor: Color.fromARGB(255, 30, 30, 84),
              ),
            ),
          ],
        );
      },
    );
  }
}
