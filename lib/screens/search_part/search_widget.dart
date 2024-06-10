import 'package:doclink_project/screens/hospital_part/hospital_screen.dart';
import 'package:doclink_project/screens/patient_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../new_models/doctor_model.dart';
import '../../new_models/hospital_model.dart';
import '../../services/api_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Hospital> hospitals = [];
  List<Hospital> filteredHospitals = [];
  Hospital? hospital;

  @override
  void initState() {
    super.initState();
    _fetchHospitals();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterHospitals(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredHospitals = [];
      } else {
        final queryLowerCase = query.toLowerCase();
        filteredHospitals = hospitals.where((hospital) {
          final hospitalName = hospital.hospitalName.toLowerCase();
          final firstWord = hospitalName.split(' ').first;
          return firstWord.startsWith(queryLowerCase);
        }).toList();
      }
    });
  }

  Future<void> _fetchHospitals() async {
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

  Future<Hospital> _fetchHospitalDetails(String hospitalId) async {
    await Future.delayed(const Duration(seconds: 2));
    return hospitals
        .firstWhere((hospital) => hospital.id.toString() == hospitalId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientProfileScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Medical Services'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onChanged: _filterHospitals,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for hospitals, clinics, etc.',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: filteredHospitals.isEmpty
                  ? Center(
                child: Text("No matching hospitals found"),
              )
                  : ListView.builder(
                itemCount: filteredHospitals.length,
                itemBuilder: (context, index) {
                  final hospital = filteredHospitals[index];
                  return ListTile(
                    style: ListTileStyle.drawer,
                    title: Text(hospital.hospitalName),
                    onTap: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );

                      try {
                        final selectedHospital = await _fetchHospitalDetails(hospital.id.toString());
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HospitalHomePage(
                              hospital: selectedHospital,
                            ),
                          ),
                        );
                      } catch (e) {
                        Navigator.pop(context);
                        print('Error fetching hospital details: $e');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
