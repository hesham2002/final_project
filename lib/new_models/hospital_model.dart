import 'dart:convert';

List<Hospital> hospitalFromJson(String str) => List<Hospital>.from(json.decode(str).map((x) => Hospital.fromJson(x)));

String hospitalToJson(List<Hospital> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hospital {
  dynamic id;
  dynamic hospitalName;
  String? hospitalImg;
  dynamic descriptionAboutHospital;
  String phone;
  LocationDetails locationDetails;
  List<String> departments;
  List<String> doctors;
  List<String> clinics;
  int location;
  List<int> availableDepartments;
  List<String> doctorsId;
  List<int> clinicsId;

  Hospital({
    required this.id,
    required this.hospitalName,
    this.hospitalImg,
    required this.descriptionAboutHospital,
    required this.phone,
    required this.locationDetails,
    required this.departments,
    required this.doctors,
    required this.clinics,
    required this.location,
    required this.availableDepartments,
    required this.doctorsId,
    required this.clinicsId,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    id: json["id"],
    hospitalName: json["hospitalName"],
    hospitalImg: json["hospitalIMG"],
    descriptionAboutHospital: json["description_about_hospital"],
    phone: json["phone"],
    locationDetails: LocationDetails.fromJson(json["location_details"]),
    departments: List<String>.from(json["departments"].map((x) => x)),
    doctors: List<String>.from(json["doctors"].map((x) => x)),
    clinics: List<String>.from(json["clinics"].map((x) => x)),
    location: json["location"],
    availableDepartments: List<int>.from(json["available_departments"].map((x) => x)),
    doctorsId: List<String>.from(json["doctorsId"].map((x) => x)),
    clinicsId: List<int>.from(json["clinicsId"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hospitalName": hospitalName,
    "hospitalIMG": hospitalImg,
    "description_about_hospital": descriptionAboutHospital,
    "phone": phone,
    "location_details": locationDetails.toJson(),
    "departments": List<dynamic>.from(departments.map((x) => x)),
    "doctors": List<dynamic>.from(doctors.map((x) => x)),
    "clinics": List<dynamic>.from(clinics.map((x) => x)),
    "location": location,
    "available_departments": List<dynamic>.from(availableDepartments.map((x) => x)),
    "doctorsId": List<dynamic>.from(doctorsId.map((x) => x)),
    "clinicsId": List<dynamic>.from(clinicsId.map((x) => x)),
  };
}

class LocationDetails {
  String street;
  String city;
  String country;

  LocationDetails({
    required this.street,
    required this.city,
    required this.country,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) => LocationDetails(
    street: json["street"],
    city: json["city"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "country": country,
  };
}
