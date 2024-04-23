import 'package:flutter/material.dart';


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class HospitalHomePage extends StatefulWidget {
  @override
  State<HospitalHomePage> createState() => _HospitalHomePageState();
}

class _HospitalHomePageState extends State<HospitalHomePage> {
  // ignore: unused_field
  int _page = 0;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 30, 84), // Light gray background
      appBar: AppBar(
        elevation: 0, // No elevation for the app bar
        backgroundColor: Color.fromARGB(255, 111, 107, 222), // Blue app bar
        title: Text(
          'Hospital',
          style: TextStyle(
            color: Colors.white, // White text for the app bar title
            fontWeight: FontWeight.bold, // Bold title
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white, // White notification icon
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Hospital',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Dark gray text
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Here you can find information about our services, doctors, and schedule appointments.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white, // Medium gray text
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildServiceCard(
                  icon: Icons.local_hospital,
                  title: 'Our Services',
                  onTap: () {
                    // Navigate to services page
                  },
                ),
                _buildServiceCard(
                  icon: Icons.person,
                  title: 'Our Doctors',
                  onTap: () {
                    // Navigate to doctors page
                  },
                ),
                _buildServiceCard(
                  icon: Icons.schedule,
                  title: 'Schedule',
                  onTap: (
                  ) {
                    Navigator.pushNamed(context,"SchadualerPage");
                    // Navigate to schedule page
                  },
                ),
              ],
            ),
            SizedBox(height: 36,),
            Container(
           
            child: Image.asset('lib/assets/assets_images/medicService.jpg') ,
            ),
          
          ],
        ),
      ),


  bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color.fromARGB(255, 141, 121, 198),
        color: Color.fromARGB(255, 147, 94, 215),
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.message, size: 26, color: Colors.white),
          Icon(Icons.add, size: 26, color: Colors.white),
          Icon(Icons.notifications, size: 26, color: Colors.white),
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
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, // White card background
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2), // Shadow offset
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Color(0xFF2196F3), // Blue icon
              size: 32.0,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333), // Dark gray text
              ),
            ),
          ],
        ),
      ),
  

      //  int  _page = 0;
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   buttonBackgroundColor: Colors.green,
      //   color: Colors.green,
      //   animationDuration: const Duration(milliseconds: 300),
      //   items: const <Widget>[
      //     Icon(Icons.home, size: 26, color: Colors.white),
      //     Icon(Icons.message, size: 26, color: Colors.white),
      //     Icon(Icons.add, size: 26, color: Colors.white),
      //     Icon(Icons.notifications, size: 26, color: Colors.white),
      //     Icon(Icons.person, size: 26, color: Colors.white),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _page = index;
      //     });
      //   },
      // ),
      // body: Center(
      //   child: Text(
      //     _page.toString(),
      //     style: const TextStyle(
      //       fontSize: 100,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
    );
  }
}