import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AssistantProvider with ChangeNotifier {
  String _name = "John Doe";
  String _doctorName = "Dr. Smith";
  String _imageUrl = "https://via.placeholder.com/150";
  Map<String, List<Message>> _chats = {};
  List<Schedule> _schedules = [];
  List<Appointment> _appointments = [];

  String get name => _name;
  String get doctorName => _doctorName;
  String get imageUrl => _imageUrl;
  Map<String, List<Message>> get chats => _chats;
  List<Schedule> get schedules => _schedules;
  List<Appointment> get appointments => _appointments;

  void addMessage(String patientId, String text, bool isAssistant) {
    final message = Message(
      id: Uuid().v4(),
      text: text,
      isAssistant: isAssistant,
      timestamp: DateTime.now(),
    );
    if (_chats[patientId] == null) {
      _chats[patientId] = [];
    }
    _chats[patientId]!.add(message);
    notifyListeners();
  }

  List<Message> getMessages(String patientId) {
    return _chats[patientId] ?? [];
  }

  void addSchedule(DateTime date, String description) {
    final schedule = Schedule(
      id: Uuid().v4(),
      date: date,
      description: description,
    );
    _schedules.add(schedule);
    notifyListeners();
  }

  void reserveAppointment(String patientName, DateTime date) {
    final appointment = Appointment(
      id: Uuid().v4(),
      patientName: patientName,
      date: date,
    );
    _appointments.add(appointment);
    notifyListeners();
  }
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

class Schedule {
  final String id;
  final DateTime date;
  final String description;

  Schedule({
    required this.id,
    required this.date,
    required this.description,
  });
}

class Appointment {
  final String id;
  final String patientName;
  final DateTime date;

  Appointment({
    required this.id,
    required this.patientName,
    required this.date,
  });
}
