import 'dart:convert';
import 'package:http/http.dart' as http;

import '../new_models/medical_user_model.dart';
class AddToApi{
  Future<void> postDoctorAccountsToAPI(MedicalUser medicalUser) async {
    try {
      // Check if the user's status is "Doctor"
      if (medicalUser.status == "Doctor") {
        // Convert MedicalUser object to JSON
        String jsonData = jsonEncode(medicalUser.toJson());

        // Define your API endpoint
        String apiUrl = 'https://salmagamalkorani.pythonanywhere.com/api/doctor';

        // Send POST request to the API
        var response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );

        // Check if the request was successful (status code 200)
        if (response.statusCode == 200) {
          print('Doctor account posted successfully.');
        } else {
          // If request was not successful, print error message
          print('Failed to post doctor account: ${response.statusCode}');
        }
      } else {
        print('User is not a doctor. Skipping posting to API.');
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      print('Error posting doctor account: $e');
    }
  }
}