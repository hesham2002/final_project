import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  String doctorId;
  dynamic doctorImg;
  String email;
  String doctorName;
  int age;
  String aboutMe;
  String specializationName;
  dynamic hospitalName;
  dynamic assistantName;
  String specialization;
  dynamic hospital;

  Doctor({
     required this.doctorId,
     this.doctorImg,
     required this.email,
     required this.doctorName,
     required this.age,
     required this.aboutMe,
     required this.specializationName,
     this.hospitalName,
     this.assistantName,
     required this.specialization,
     this.hospital,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    doctorId: json["doctor_id"],
    doctorImg: json["doctorIMG"],
    email: json["email"],
    doctorName: json["doctorName"],
    age: json["age"],
    aboutMe: json["aboutMe"],
    specializationName: json["specialization_name"],
    hospitalName: json["hospital_name"],
    assistantName: json["assistant_name"],
    specialization: json["specialization"],
    hospital: json["hospital"],
  );

  Map<String, dynamic> toJson() => {
    "doctor_id": doctorId,
    "doctorIMG": doctorImg,
    "email": email,
    "doctorName": doctorName,
    "age": age,
    "aboutMe": aboutMe,
    "specialization_name": specializationName,
    "hospital_name": hospitalName,
    "assistant_name": assistantName,
    "specialization": specialization,
    "hospital": hospital,
  };
}
