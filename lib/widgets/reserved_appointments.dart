import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../helper/assistant_provider.dart';

class ReservedAppointment extends StatefulWidget {
  const ReservedAppointment({Key? key}) : super(key: key);

  @override
  State<ReservedAppointment> createState() => _ReservedAppointmentState();
}

class _ReservedAppointmentState extends State<ReservedAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserved Appointments'),
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
      ),
      body: Consumer<AssistantProvider>(
        builder: (context, assistantProvider, _) {
          List<Appointment> appointments = assistantProvider.appointments;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Add some spacing at the top
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      'Reserved Appointments:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800], // Adjust text color
                      ),
                    ),
                    SizedBox(width: 10), // Add spacing between text and icon
                    Icon(
                      FontAwesomeIcons.businessTime,
                      size: 20,
                      color: Colors.grey[800], // Adjust icon color
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Add some spacing between the title and list
              Expanded(
                child: Card(
                  elevation: 5, // Add elevation for a raised effect
                  margin: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView.builder(
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(appointments[index].patientName),
                        subtitle: Text(
                          appointments[index].date.toString(),
                          style: TextStyle(color: Colors.grey[700]), // Adjust subtitle color
                        ),
                        // Add more details if needed
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
