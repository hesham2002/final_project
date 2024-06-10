import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ReceivePatientsScreen extends StatefulWidget {
  @override
  _ReceivePatientsScreenState createState() => _ReceivePatientsScreenState();
}

class _ReceivePatientsScreenState extends State<ReceivePatientsScreen> {
  File? _image; // To store the picked image

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
            _buildReportCard(),  // Update this line to call _buildReportCard

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

  Widget _buildReportCard() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: SizedBox(
          width: 180, // Set your desired width here
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[400]!), // Add border
            ),
            height: 200,
            alignment: Alignment.center,
            child: _image == null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 50, color: Colors.grey[700]),
                SizedBox(height: 10),
                Text(
                  'Tap to open report',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey[700]),
                ),
              ],
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                _image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
