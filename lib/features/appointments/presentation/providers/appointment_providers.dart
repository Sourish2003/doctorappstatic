import 'package:flutter/foundation.dart';

class AppointmentProvider extends ChangeNotifier {
  DateTime? _selectedDate;
  String? _selectedTime;
  bool _isBooked = false;

  DateTime? get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;
  bool get isBooked => _isBooked;

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void selectTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }

  void bookAppointment() {
    _isBooked = true;
    notifyListeners();
  }
}