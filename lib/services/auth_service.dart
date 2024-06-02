import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/medical_user_model.dart';
import '../models/patient_user_model.dart';

class AuthService{
  Future<void> saveUserData(MedicalUser user) async {
    try {
      CollectionReference usersCollection;

      // Determine the collection to use based on the selected status
      switch (user.status) {
        case 'Doctor':
          usersCollection = FirebaseFirestore.instance.collection('doctor_accounts');
          break;
        case 'Receptionist':
          usersCollection = FirebaseFirestore.instance.collection('receptionist_accounts');
          break;
        case "Doctor's Assistant":
          usersCollection = FirebaseFirestore.instance.collection('assistant_accounts');
          break;
        default:
        // Handle unknown status
          return;
      }

      // Add the user data to the appropriate collection
      await usersCollection.add(user.toJson());
    } catch (error) {
      print("Error saving user data: $error");
      // Handle error
    }
  }

  Future<void> savePatientData(PatientUser patient) async {
    try {
      await FirebaseFirestore.instance.collection('patients').add(
          patient.toJson());
    } catch (error) {
      print("Error saving patient data: $error");
      // Handle error
    }
  }
}