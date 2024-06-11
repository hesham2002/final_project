import 'dart:convert';

class MedicalUser {
  String? uid;
  String? username;
  String? nationalId;
  String? jobId;
  String? email;
  String? status;
  String? doctorId;

  MedicalUser({
    this.uid,
    this.username,
    this.nationalId,
    this.jobId,
    this.email,
    this.status,
    this.doctorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'nationalId': nationalId,
      'jobId': jobId,
      'email': email,
      'status': status,
      'doctorId': doctorId,
    };
  }

  factory MedicalUser.fromMap(Map<String, dynamic> map) {
    return MedicalUser(
      uid: map['uid'],
      username: map['username'],
      nationalId: map['nationalId'],
      jobId: map['jobId'],
      email: map['email'],
      status: map['status'],
      doctorId: map['doctorId'],
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory MedicalUser.fromJson(String source) {
    return MedicalUser.fromMap(json.decode(source));
  }
}
