import 'package:flutter/material.dart';
import '../../models/demo_test.dart';
import '../../new_models/hospital_model.dart';
import '../../services/api_service.dart';

class DoctorsScreen extends StatefulWidget {
  final Hospital hospital;

  const DoctorsScreen({Key? key, required this.hospital}) : super(key: key);

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
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
        itemCount: widget.hospital.doctors.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey, // Add a background color
                    child: Icon(Icons.person,
                        color: Colors.white), // Doctor avatar icon
                  ),
                  title: Text(
                    widget.hospital.doctors[index],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Specialization',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ));
        },
      ),
    );
  }
}
