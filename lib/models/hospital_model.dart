class HospitalModel {
  String hospitalName;
  String description;
  String image;
  String location;
  HospitalModel(
      {required this.hospitalName,
      required this.description,
      required this.image,
      required this.location});

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      hospitalName: json['hospitalName'],
      description: json['description'],
      image: json['image'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hospitalName': hospitalName,
      'description': description,
      'image': image,
      'location': location,
    };
  }
}
