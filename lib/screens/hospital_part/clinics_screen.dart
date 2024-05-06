import 'package:flutter/material.dart';
import '../../models/clinic_model.dart';

class ClinicScreen extends StatefulWidget {
  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  final List<Clinic> clinics = [
    Clinic(name: 'Emergency Department', icon: Icons.local_hospital),
    Clinic(name: 'Outpatient Clinic', icon: Icons.local_hospital),
    Clinic(name: 'Surgical Clinic', icon: Icons.local_hospital),
    Clinic(name: 'Internal Medicine Clinic', icon: Icons.local_hospital),
    Clinic(name: 'Pediatrics Clinic', icon: Icons.child_care),
    Clinic(name: 'Obstetrics and Gynecology Clinic', icon: Icons.pregnant_woman),
    Clinic(name: 'Orthopedic Clinic', icon: Icons.accessibility),
    Clinic(name: 'Cardiology Clinic', icon: Icons.favorite),
    Clinic(name: 'Neurology Clinic', icon: Icons.healing),
    Clinic(name: 'Oncology Clinic', icon: Icons.local_hospital),
    Clinic(name: 'Psychiatry Clinic', icon: Icons.psychology),
    Clinic(name: 'Radiology Department', icon: Icons.science),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        centerTitle: true,
        title: Text('Clinics', style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 1.0,
        ),
        itemCount: clinics.length,
        itemBuilder: (context, index) {
          return ClinicCard(clinic: clinics[index]);
        },
      ),
    );
  }
}

class ClinicCard extends StatelessWidget {
  final Clinic clinic;

  ClinicCard({required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(clinic.icon, size: 50, color: Colors.red),
            SizedBox(height: 10.0),
            Text(
              clinic.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
