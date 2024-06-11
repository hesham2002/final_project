import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helper/assistant_provider.dart';
import '../services/auth_service.dart';

class AssistantProfilePage extends StatefulWidget {
  final String userDocId;

  AssistantProfilePage({required this.userDocId});
  @override
  State<AssistantProfilePage> createState() => _AssistantProfilePageState();
}

class _AssistantProfilePageState extends State<AssistantProfilePage> {
  Future<void> _showSignOutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            'Sign out',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          content: Text(
            'Are you sure that you want to log out?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                AuthService().signOut(context);
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
        child: SingleChildScrollView(
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
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: () {
                  _showSignOutDialog(context);
                },
                child: Text(
                  'Sign out',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 30, 30, 84)),
                  // You can add more styles here if needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 10),
          Text(label, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  void _addSchedule(BuildContext context) {
    // Implement the logic for adding schedule here
    print('Add Schedule button pressed');
  }

  void _reserveAppointment(BuildContext context) {
    // Implement the logic for reserving appointment here
    TextEditingController patientNameController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reserve Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: patientNameController,
                decoration: InputDecoration(labelText: 'Patient Name'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate)
                    setState(() {
                      selectedDate = picked;
                    });
                },
                child: Text("Select date"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String patientName = patientNameController.text;
                if (patientName.isNotEmpty) {
                  Provider.of<AssistantProvider>(context, listen: false).reserveAppointment(patientName, selectedDate);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Reserve'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToChat(BuildContext context) {
    // Implement the logic for navigating to chat screen here
    print('Chat button pressed');
  }
}
