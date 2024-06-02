class PatientUser {
  String? id;
  String? email;

  PatientUser({
    this.id,
    this.email,
  });

  factory PatientUser.fromJson(Map<String, dynamic> json) {
    return PatientUser(
      id: json['id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
