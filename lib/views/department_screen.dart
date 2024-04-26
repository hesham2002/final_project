
import 'package:flutter/material.dart';

class MyDepartmentPage extends StatelessWidget {
  const MyDepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(" Departments "),
        centerTitle: true,
        actions: [
     IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        // Handle search functionality
      },
    ),
  ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
        
            )
          ],
        ),
      ),
    );
  }
}