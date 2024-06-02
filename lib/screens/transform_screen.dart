import 'package:doclink_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class TransformScreen extends StatefulWidget {
  TransformScreen({Key? key, this.selectedValue}) : super(key: key);
  final String? selectedValue;

  @override
  State<TransformScreen> createState() => _TransformScreenState();
}

class _TransformScreenState extends State<TransformScreen> {
  final List<String> items = ['Hospital 1', 'Hospital 2', 'Hospital 3'];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transform Patient'),
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
        child: ListView(
          children: [
            SizedBox(height: 20),
            _buildTextField('enter the name', 'Patient Name'),
            SizedBox(height: 20),
            _buildTextField('enter the id', 'ID'),
            SizedBox(height: 20),
            _buildCameraContainer(),
            SizedBox(height: 20),
            _buildDropdown(),
            SizedBox(height: 30),
            _buildSendButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, String labelText) {
    return CustomTextField(

      hintText: hintText,
      labelText: labelText,
      hiddenText: false,
      onTapOutside: (p0) => FocusScope.of(context).unfocus(),
    );
  }

  Widget _buildCameraContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 50.0,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Text(
              'Select a report image\nfrom your gallery',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(25),
      ),
      child: DropdownButton<String>(
        hint: Text(
          "Select doctor",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        value: selectedValue,
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        dropdownColor: Colors.blueGrey[50],
      ),
    );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      onTap: () {
        // Handle send action
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 52,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 30, 30, 84),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            'Send',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
