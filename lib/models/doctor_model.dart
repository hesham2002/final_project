class DoctorModel {
  final String image;
  final String doctorId;
  final String doctorName;
  final String email;
  final String specializationName;
  final String hospitalName;
  final int specialization;
  final int hospital;

  DoctorModel({
    required this.image,
    required this.doctorId,
    required this.doctorName,
    required this.email,
    required this.specializationName,
    required this.hospitalName,
    required this.specialization,
    required this.hospital,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorId: json['doctor_id'],
      doctorName: json['doctorName'],
      email: json['email'],
      specializationName: json['specialization_name'],
      hospitalName: json['hospital_name'],
      specialization: json['specialization'],
      hospital: json['hospital'], image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor_image':image,
      'doctor_id': doctorId,
      'doctorName': doctorName,
      'email': email,
      'specialization_name': specializationName,
      'hospital_name': hospitalName,
      'specialization': specialization,
      'hospital': hospital,
    };
  }
}
