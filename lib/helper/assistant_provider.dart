import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AssistantProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Appointment> _appointments = [];
  String name = 'Assistant Name';
  String doctorName = 'Doctor Name';
  Map<String, List<Message>> _chats = {}; // Added chats map

  List<Appointment> get appointments => _appointments;

  Future<void> fetchAppointments() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final assistantDoc = await _firestore.collection('assistants').doc(user.uid).get();
      final doctorId = assistantDoc.data()?['doctorId'];

      if (doctorId != null) {
        final appointmentSnapshot = await _firestore.collection('doctors')
            .doc(doctorId)
            .collection('appointments')
            .get();

        _appointments = appointmentSnapshot.docs.map((doc) {
          return Appointment(
            patientName: doc.data()['patientName'],
            date: (doc.data()['date'] as Timestamp).toDate(),
          );
        }).toList();
        notifyListeners();
      }
    }
  }

  Future<void> reserveAppointment(String patientName, DateTime date) async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final assistantDoc = await _firestore.collection('assistants').doc(user.uid).get();
      final doctorId = assistantDoc.data()?['doctorId'];

      if (doctorId != null) {
        final appointment = {
          'patientName': patientName,
          'date': date,
        };

        await _firestore.collection('doctors')
            .doc(doctorId)
            .collection('appointments')
            .add(appointment);

        // Update local list
        _appointments.add(Appointment(patientName: patientName, date: date));
        notifyListeners();
      }
    }
  }

  // Method to get messages for a particular patient
  List<Message> getMessages(String patientId) {
    return _chats[patientId] ?? [];
  }

  // Add schedule method (if needed)
  Future<void> addSchedule(DateTime date, String description) async {
    // Implementation here...
  }

  // Add message method (if needed)
  Future<void> addMessage(String patientId, String text, bool isAssistant) async {
    // Implementation here...
  }
}

class Appointment {
  final String patientName;
  final DateTime date;

  Appointment({required this.patientName, required this.date});
}

class Message {
  final String id;
  final String text;
  final bool isAssistant;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.text,
    required this.isAssistant,
    required this.timestamp,
  });
}
