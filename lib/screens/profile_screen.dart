import 'dart:convert';
import 'package:doclink_project/models/doctor_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<List<DoctorModel>> getDoctorData() async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://salmagamalkorani.pythonanywhere.com/api/doctor'));

      List<dynamic> jsonData = jsonDecode(response.body);

      List<DoctorModel> doctor = [];
      for (var u in jsonData) {
        DoctorModel doctorModel = DoctorModel(
          doctorId: u['doctorId'],
          doctorName: u['doctorName'],
          email: u['email'],
          specializationName: u['specializationName'],
          hospitalName: u['hospitalName'],
          specialization: u['specialization'],
          hospital: u['hospital'],
        );

        doctor.add(doctorModel);
      }
      if (kDebugMode) {
        print(doctor.length);
      }
      return doctor; // Return the list after it's fully populated
    } catch (error) {
      print('Error fetching data: $error');
      throw error; // Rethrow the error to handle it in the UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF191C29),
        centerTitle: true,
        title: Text('Doctor Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder<List<DoctorModel>>(
          future: getDoctorData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Doctor ID: ${snapshot.data![0].doctorId}', // Access the first doctor's data
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Doctor Name: ${snapshot.data![0].doctorName}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email: ${snapshot.data![0].email}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Specialization: ${snapshot.data![0].specializationName}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hospital: ${snapshot.data![0].hospitalName}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement sign out functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Sign Out'),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
