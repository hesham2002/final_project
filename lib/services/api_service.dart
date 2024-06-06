import 'dart:convert';
import '../new_models/clinic_model.dart';
import '../new_models/doctor_model.dart';
import '../new_models/hospital_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Hospital>> fetchHospitals() async {
    final response = await http.get(
        Uri.parse('https://salmagamalkorani.pythonanywhere.com/api/hospital'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Hospital.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load hospitals');
    }
  }

  Future<List<Doctor>> fetchDoctors() async {
    final response = await http.get(
        Uri.parse('https://salmagamalkorani.pythonanywhere.com/api/doctor'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Doctor.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  Future<List<Clinic>> fetchClinics() async {
    final response = await http.get(
        Uri.parse('https://salmagamalkorani.pythonanywhere.com/api/clinic'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Clinic.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load clinics');
    }
  }
}
