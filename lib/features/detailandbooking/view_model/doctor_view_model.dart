// lib/features/detailandbooking/view_model/doctor_view_model.dart
import 'package:flutter/foundation.dart';
import '../model/date_model.dart';

class DoctorViewModel extends ChangeNotifier {
  DateTime? selectedDate;
  String? selectedTime;
  bool isBooked = false;
  int _selectedDateIndex = 1; // Default to second date
  int _selectedTimeIndex = 1; // Default to second time slot

  // Generate next 7 days
  List<DateModel> get dates {
    final today = DateTime.now();
    return List.generate(7, (index) {
      final date = today.add(Duration(days: index));
      return DateModel(
        dayName: _getDayName(date.weekday),
        date: date.day,
        isSelected: index == _selectedDateIndex,
      );
    });
  }

  // Available time slots
  final List<String> timeSlots = [
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
  ];

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  void selectDate(int index) {
    _selectedDateIndex = index;
    selectedDate = DateTime.now().add(Duration(days: index));
    notifyListeners();
  }

  void selectTime(int index) {
    _selectedTimeIndex = index;
    selectedTime = timeSlots[index];
    notifyListeners();
  }

  bool isTimeSelected(int index) => index == _selectedTimeIndex;
  bool isDateSelected(int index) => index == _selectedDateIndex;

  void bookAppointment() {
    isBooked = true;
    notifyListeners();
  }
}