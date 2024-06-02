import 'package:doclink_project/widgets/reserved_appointments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:doclink_project/screens/doctor_part/appointment_screen.dart';
import 'package:doclink_project/helper/assistant_provider.dart';

import '../../models/medical_user_model.dart';
import '../transform_screen.dart';

class DoctorProfileScreen extends StatefulWidget {
  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  String? selectedDropdownItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Transform Patient Option Icon

          // Notifications Icon
          PopupMenuButton<String>(
            icon: Icon(Icons.notifications),
            itemBuilder: (BuildContext context) {
              return dropdownItems.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (String selectedItem) {
              setState(() {
                selectedDropdownItem = selectedItem;
              });
            },
          ),
        ],
        title: Text('Doctor Profile'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      AssetImage('lib/assets/assets_images/doctor3.jpg'),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dr. John Doe',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: IconButton(
                            icon: Icon(Icons.transform,color: Color.fromARGB(255, 30, 30, 84),), // Adjust the icon to your preference
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransformScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 25), // Adjust the spacing between icons as needed
                        CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.table,color: Color.fromARGB(255, 30, 30, 84),), // Adjust the icon to your preference
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReservedAppointment(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Age: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '40',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'About me: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'I am a cardiologist with 15 years of experience.',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'Specialization: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cardiologist',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'Hospital: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'XYZ Hospital',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'My Assistant: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ahmed Kamal',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
