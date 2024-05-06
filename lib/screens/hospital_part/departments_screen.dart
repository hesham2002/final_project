import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DepartmentsScreen extends StatefulWidget {
  const DepartmentsScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> {
  List<dynamic> catNames = [
    "Emergency",
    "Cardiology",
    "Orthopedics",
    "Neurology",
    "Oncology",
    "Pediatrics",
    "Gynecology",
    "ENT (Ear, Nose, Throat)"
  ];
  List<Icon> catIcons = [
    Icon(
      MdiIcons.alert,
      color: Colors.indigoAccent,
      size: 30,
    ),
    Icon(
      MdiIcons.heartPlus,
      color: Colors.redAccent,
      size: 30,
    ),
    Icon(
      MdiIcons.bone,
      color: Colors.blueAccent,
      size: 30,
    ),
    Icon(
      MdiIcons.brain,
      color: Colors.deepPurpleAccent,
      size: 30,
    ),
    Icon(
      MdiIcons.zodiacCancer,
      color: Colors.purpleAccent,
      size: 30,
    ),
    Icon(
      MdiIcons.babyBottle,
      color: Colors.deepPurpleAccent,
      size: 30,
    ),
    Icon(
      MdiIcons.humanFemale,
      color: Colors.deepPurpleAccent,
      size: 30,
    ),
    Icon(
      Icons.hearing,
      color: Colors.deepPurpleAccent,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        centerTitle: true,
        title: Text('Departments'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: catNames.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 30, 30, 84)),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: catIcons[index],
                ),
                SizedBox(width: 20),
                Text(
                  catNames[index],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
