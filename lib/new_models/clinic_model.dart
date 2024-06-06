class Clinic {
  final int id;
  final String name;

  Clinic({required this.id, required this.name});

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      name: json['name'],
    );
  }
}