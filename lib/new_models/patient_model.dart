import 'dart:convert';
Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String welcomeToJson(Patient data) => json.encode(data.toJson());

class Patient {
  String? id;
  dynamic patientImg;
  String patientName;
  String phone;
  String medicalHistory;
  String email;
  dynamic prescription;
  dynamic location;

  Patient({
    this.id,
    required this.patientImg,
    required this.patientName,
    required this.phone,
    required this.medicalHistory,
    required this.email,
    required this.prescription,
    required this.location,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    patientImg: json["patientIMG"],
    patientName: json["patientName"],
    phone: json["phone"],
    medicalHistory: json["medicalHistory"],
    email: json["email"],
    prescription: json["prescription"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patientIMG": patientImg,
    "patientName": patientName,
    "phone": phone,
    "medicalHistory": medicalHistory,
    "email": email,
    "prescription": prescription,
    "location": location,
  };
}
