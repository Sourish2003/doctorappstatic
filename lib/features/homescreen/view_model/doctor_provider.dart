import 'package:flutter/foundation.dart';
import '../models/doctors.dart';

class HomeViewProvider extends ChangeNotifier {
  final List<Doctor> _doctors = [
    Doctor(
      id: '1',
      name: 'Dr. Albert Flores',
      specialization: 'Cardiologist',
      imageUrl: 'lib/assets/doctor_1.jpg',
      rating: 4.7,
      yearsExperience: 8,
      satisfactionRate: 92,
      fee: 70,
      biography: 'Lorem ipsum is simply dummy text of the printing and industry...',
      totalPatients: 320,
    ),
    Doctor(
      id: '2',
      name: 'Darrell Steward',
      specialization: 'General Practitioner',
      imageUrl: 'lib/assets/doctor_1.jpg',
      rating: 4.5,
      yearsExperience: 5,
      satisfactionRate: 92,
      fee: 75,
      biography: 'Lorem ipsum is simply dummy text of the printing and industry...',
      totalPatients: 280,
    ),
  ];

  List<Doctor> get doctors => _doctors;

  final List<Category> _categories = [
    // // Category(id: '1', name: 'Heart', iconPath: 'assets/icons/heart.svg'),
    // const Category(id: '2', name: 'Kidney', iconPath: 'lib/assets/icons/kidney.svg'),
    // // Category(id: '3', name: 'Brain', iconPath: 'assets/icons/brain.svg'),
    // // Category(id: '4', name: 'Lungs', iconPath: 'assets/icons/lungs.svg'),
  ];

  List<Category> get categories => _categories;
}