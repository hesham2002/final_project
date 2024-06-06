import 'package:flutter/material.dart';

class ReceivePatientsScreen extends StatefulWidget {
  @override
  _ReceivePatientsScreenState createState() => _ReceivePatientsScreenState();
}

class _ReceivePatientsScreenState extends State<ReceivePatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Receive Patient'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 30, 30, 84),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            _buildOvalCard('Patient Name: '),
           SizedBox(height: 15,),
            _buildOvalCard('ID: '),
            SizedBox(height: 15,),
            _buildOvalCard('Report: '),

            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 30, 30, 84),
                    minimumSize: Size(150, 50),
                    side: BorderSide(color: Colors.black), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30.0), // Circular border
                    ),
                  ),
                  child: Text(
                    'Accept',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 30, 30, 84),
                    minimumSize: Size(150, 50),
                    side: BorderSide(color: Colors.black), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30.0), // Circular border
                    ),
                  ),
                  child: Text(
                    'Refuse',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOvalCard(String label) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      height: 60,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        textAlign: TextAlign.start,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
