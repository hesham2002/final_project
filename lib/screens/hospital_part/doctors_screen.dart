import 'dart:convert';

import 'package:flutter/material.dart';
import '../../new_models/doctor_model.dart';
import '../../new_models/hospital_model.dart';
import '../../services/api_service.dart';
import '../doctor_part/doctor_profile_screen.dart';
import 'package:http/http.dart' as http;
class DoctorsScreen extends StatefulWidget {
  final Hospital hospital;

  const DoctorsScreen({Key? key, required this.hospital}) : super(key: key);

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(
        Uri.parse('https://salmagamalkorani.pythonanywhere.com/api/doctor'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Doctor.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        title: Text('Hospital\'s Doctors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<List<Doctor>>(
        future: fetchDoctors(),  // Directly call fetchDoctors() without late
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No doctors found.'));
          } else {
            List<Doctor> doctors = snapshot.data!;
            return ListView.builder(
              itemCount: widget.hospital.doctors.length,
              itemBuilder: (context, index) {
                Doctor doctor = doctors[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(
                        doctor.doctorName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        doctor.specializationName,
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorProfileScreen(doctor: doctor), // Pass the doctor data
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
