import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink_project/screens/auth_screens/medical_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doclink_project/new_models/medical_user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../new_models/patient_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(MedicalUser medicalUser) async {
    final User? user = _auth.currentUser;
    if (user != null) {
      medicalUser.uid = user.uid;
      String collectionPath;

      if (medicalUser.status == 'Doctor') {
        collectionPath = 'doctors';
      } else if (medicalUser.status == 'Receptionist') {
        collectionPath = 'receptionists';
      } else if (medicalUser.status == "Doctor's Assistant") {
        collectionPath = 'assistants';
        // Check if there is a doctor with the same jobId
        QuerySnapshot doctorQuery = await _firestore.collection('doctors')
            .where('jobId', isEqualTo: medicalUser.jobId)
            .limit(1)
            .get();

        if (doctorQuery.docs.isNotEmpty) {
          // Update assistant's record with doctor's ID
          medicalUser.doctorId = doctorQuery.docs.first.id;
          // Update doctor's record with assistant's ID
          await _firestore.collection('doctors').doc(doctorQuery.docs.first.id).update({
            'assistantId': user.uid,
          });
        }
      } else {
        throw Exception('Invalid user status');
      }

      await _firestore.collection(collectionPath).doc(user.uid).set(medicalUser.toMap());
    }
  }

  Future<DocumentSnapshot?> getUserData(String email, String jobId, String status) async {
    String collectionPath;
    if (status == 'Doctor') {
      collectionPath = 'doctors';
    } else if (status == 'Receptionist') {
      collectionPath = 'receptionists';
    } else if (status == "Doctor's Assistant") {
      collectionPath = 'assistants';
    } else {
      throw Exception('Invalid user status');
    }

    QuerySnapshot querySnapshot = await _firestore
        .collection(collectionPath)
        .where('email', isEqualTo: email)
        .where('jobId', isEqualTo: jobId)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      return null;
    }
  }

  Future<void> savePatientData(Patient patient) async {
    try {
      await _firestore.collection('patients').doc(patient.email).set({
        'email': patient.email,
        'image': patient.image,
        'username': patient.username,
        'patientId': patient.patientId,
        'phoneNumber': patient.phoneNumber,
        'location':patient.location,
      });
    } catch (e) {
      // Handle error
      print('Error saving patient data: $e');
      throw Exception('Error saving patient data');
    }
  }
  Future<void> signOut(BuildContext context) async {
    // Clear saved login state using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');

    await FirebaseAuth.instance.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MedicalLoginScreen()),
          (Route<dynamic> route) => false, // Prevent going back to the previous screen
    );
  }

}




