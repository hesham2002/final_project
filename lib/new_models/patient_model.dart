import 'dart:convert';

class Patient {
  final String email;
  final String image;
  final String username;
  final String patientId;
  final String phoneNumber;
  final String location; // New variable for location

  Patient({
    required this.email,
    required this.image,
    required this.username,
    required this.patientId,
    required this.phoneNumber,
    required this.location,
  });

  // Factory method to create a Patient from JSON
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      email: json['email'],
      image: json['image'],
      username: json['username'],
      patientId: json['patientId'],
      phoneNumber: json['phoneNumber'],
      location: json['location'], // Initialize location from JSON
    );
  }

  // Method to convert a Patient instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'image': image,
      'username': username,
      'patientId': patientId,
      'phoneNumber': phoneNumber,
      'location': location, // Add location to JSON
    };
  }

  // Method to convert a Patient instance to a JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Factory method to create a Patient from a JSON string
  factory Patient.fromJsonString(String jsonString) {
    return Patient.fromJson(jsonDecode(jsonString));
  }
}
