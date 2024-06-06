class DoctorModel {
  final String name;
  final String specialization;
  final String photoUrl;

  DoctorModel({
    required this.photoUrl,
    required this.name,
    required this.specialization,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
    );
  }
}
