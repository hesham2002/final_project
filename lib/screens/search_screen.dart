import 'package:flutter/material.dart';

class Search_screen extends StatefulWidget {
  @override
  _Search_screenState createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Medical Services'),
        centerTitle: true,
        backgroundColor: Color(0xFF191C29), // Set custom app bar color
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Search for Medical Services',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for hospitals, clinics, etc.',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String searchQuery = _searchController.text;
                // Implement search functionality here
              },
              child: Text('Search'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF191C29), // Set custom button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
