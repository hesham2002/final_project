class MedicalUser {
  String? username;
  String? nationalId;
  String? jobId;
  String? email;

  String? status;

  MedicalUser({
    required this.username,
    required this.nationalId,
    required this.jobId,
    required this.email,
    required this.status,
  });

  factory MedicalUser.fromJson(Map<String, dynamic> json) {
    return MedicalUser(
      username: json['username'],
      nationalId: json['nationalId'],
      jobId: json['jobId'],
      email: json['email'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'nationalId': nationalId,
      'jobId': jobId,
      'email': email,
      'status': status,
    };
  }
}
