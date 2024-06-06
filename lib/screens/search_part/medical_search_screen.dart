import 'package:doclink_project/screens/hospital_part/hospital_screen.dart';
import 'package:doclink_project/screens/patient_profile_screen.dart';
import 'package:doclink_project/screens/search_part/search_widget.dart';
import 'package:flutter/material.dart';


import '../../new_models/doctor_model.dart';
import '../../new_models/hospital_model.dart';
import '../../services/api_service.dart';

class MedicalServicesSearchScreen extends StatefulWidget {

  @override
  _MedicalServicesSearchScreenState createState() =>
      _MedicalServicesSearchScreenState();

}

class _MedicalServicesSearchScreenState
    extends State<MedicalServicesSearchScreen> {
  TextEditingController _searchController = TextEditingController();

  String? selectedValue1;
  List<Hospital> hospitals = [];

  @override
  void initState() {
    super.initState();
    fetchHospitals();
  }

  Future<void> fetchHospitals() async {
    try {
      final apiService = ApiService();
      final fetchedHospitals = await apiService.fetchHospitals();
      setState(() {
        hospitals = fetchedHospitals;
      });
    } catch (e) {
      print('Error fetching hospitals: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientProfileScreen()),
                );
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
        title: Text('Medical Services'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(

                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                                15.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(

                        child: Text('Search for hospitals, clinics, etc.'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String searchQuery = _searchController.text;

                },
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 30, 30, 84),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Suggested Results',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                hint: Text('Select Hospital'),
                value: selectedValue1,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue1 = newValue;
                    // Navigate to Hospital Screen
                    if (newValue != null) {
                      Hospital selectedHospital = hospitals.firstWhere(
                              (hospital) => hospital.id.toString() == newValue);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HospitalHomePage(
                            hospital: selectedHospital,
                          ),
                        ),
                      );
                    }
                  });
                },
                items: hospitals.map((hospital) {
                  return DropdownMenuItem<String>(
                    value: hospital.id.toString(),
                    child: Text(hospital.hospitalName),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Hospitals',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
