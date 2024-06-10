import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doclink_project/screens/hospital_part/clinics_screen.dart';
import 'package:doclink_project/screens/hospital_part/departments_screen.dart';
import 'package:doclink_project/screens/hospital_part/doctors_screen.dart';
import 'package:doclink_project/new_models/hospital_model.dart';

import '../search_part/medical_search_screen.dart';

class HospitalHomePage extends StatefulWidget {
  const HospitalHomePage({super.key, required this.hospital});

  final Hospital hospital;

  @override
  State<HospitalHomePage> createState() => _HospitalHomePageState();
}

class _HospitalHomePageState extends State<HospitalHomePage> {
  int _page = 0;

  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {

      _fontSize = 20.0;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 84),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicalServicesSearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search, size: 30),
          )
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 40, 107, 222),
        title: Text(
          widget.hospital.hospitalName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: _fontSize + 3,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Our Hospital',
              style: TextStyle(
                fontSize: _fontSize + 8.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.hospital.descriptionAboutHospital,
              style: TextStyle(
                fontSize: _fontSize,
                color: Colors.white,
              ),
              maxLines: 3, // Limiting to 3 lines
              overflow: TextOverflow.ellipsis, // Show ellipsis when text overflows
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildServiceCard(
                  icon: Icons.local_pharmacy,
                  title: 'Departments',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepartmentsScreen(
                          hospital: widget.hospital,
                        ),
                      ),
                    );
                  },
                ),
                _buildServiceCard(
                  icon: Icons.person,
                  title: 'Our Doctors',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorsScreen(hospital: widget.hospital),
                      ),
                    );
                  },
                ),
                _buildServiceCard(
                  icon: Icons.local_hospital,
                  title: 'Clinics',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ClinicScreen(hospital: widget.hospital),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .23,
              child: Image.network(
                widget.hospital.hospitalImg.toString(),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '${widget.hospital.locationDetails.street}, ${widget.hospital.locationDetails.city}, ${widget.hospital.locationDetails.country}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  child: Icon(
                    Icons.phone,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.hospital.phone,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color.fromARGB(255, 40, 121, 198),
        color: const Color.fromARGB(255, 40, 94, 215),
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.person, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFF2196F3),
              size: 32.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: _fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
