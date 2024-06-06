import 'dart:convert';
Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String welcomeToJson(Patient data) => json.encode(data.toJson());

class Patient {
  String patientId;
  dynamic patientImg;
  String patientName;
  String phone;
  String medicalHistory;
  String email;
  dynamic prescription;
  dynamic location;

  Patient({
    required this.patientId,
    required this.patientImg,
    required this.patientName,
    required this.phone,
    required this.medicalHistory,
    required this.email,
    required this.prescription,
    required this.location,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    patientId: json["patient_id"],
    patientImg: json["patientIMG"],
    patientName: json["patientName"],
    phone: json["phone"],
    medicalHistory: json["medicalHistory"],
    email: json["email"],
    prescription: json["prescription"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "patient_id": patientId,
    "patientIMG": patientImg,
    "patientName": patientName,
    "phone": phone,
    "medicalHistory": medicalHistory,
    "email": email,
    "prescription": prescription,
    "location": location,
  };
}
