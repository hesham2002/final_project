import 'package:doclink_project/screens/doctor_part/appointment_screen.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                  backgroundImage: AssetImage(
                      'lib/assets/assets_images/doctor3.jpg'), // You need to replace this with your actual image path
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Dr. John Doe',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),

                ],
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
                              fontWeight: FontWeight.bold),
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
                          maxLines: 2,
                          'About me: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'iam a dental ',
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
                          'Specialization: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
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
                              fontWeight: FontWeight.bold),
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
                              fontWeight: FontWeight.bold),
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
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentScreen(),));
                  },
                  child: Card(
                    elevation: 10,
                    child: Column(

                      children: [
                       Icon(Icons.schedule),
                       Text(
                        'reserve an appointment',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],)
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
          ),
        ),
      ),
    );
  }
}
