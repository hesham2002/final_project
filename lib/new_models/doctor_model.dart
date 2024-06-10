import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

class Doctor {
  dynamic jobId;
  dynamic nationalId;
  dynamic doctorImg;
  dynamic email;
  dynamic doctorName;
  dynamic age;
  dynamic aboutMe;
  dynamic specializationName;
  dynamic hospitalName;
  dynamic assistantName;
  dynamic specialization;
  dynamic hospital;

  Doctor({
    this.nationalId,
     required this.jobId,
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
    nationalId: json['nationalId'],
    jobId: json["jobId"],
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
    "nationalId":nationalId,
    "jobId": jobId,
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
