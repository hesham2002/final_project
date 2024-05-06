import 'package:flutter/material.dart';

import '../../models/demo_test.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final List<Doctor> doctors = [
    Doctor(name: "Dr. John Doe", specialization: "Cardiologist", photoUrl: ""),
    Doctor(name: "Dr. Alice Smith", specialization: "Pediatrician", photoUrl: ""),
    Doctor(name: "Dr. Michael Johnson", specialization: "Neurologist", photoUrl: ""),
    Doctor(name: "Dr. Sarah Williams", specialization: "Orthopedic Surgeon", photoUrl: ""),
    Doctor(name: "Dr. Emily Brown", specialization: "Oncologist", photoUrl: ""),
    Doctor(name: "Dr. David Wilson", specialization: "ENT Specialist", photoUrl: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        title: Text('hospital\'s doctors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(doctor.photoUrl),
                  ),
                  title: Text(
                    doctor.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    doctor.specialization,
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {}
              ),
            ),
          );
        },
      ),
    );
  }
}
