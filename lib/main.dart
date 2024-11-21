import 'package:doctorappstatic/features/detailandbooking/view/doctor_details_page.dart';
import 'package:doctorappstatic/features/detailandbooking/view_model/doctor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/homescreen/view/home_page.dart';
import 'features/homescreen/view_model/doctor_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DoctorViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor Appointment App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const DoctorsPage(),
          '/doctors': (context) => const DoctorsPage(),
          '/doctor-details': (context) => const DoctorDetailsPage(),
        },
      ),
    );
  }
}
