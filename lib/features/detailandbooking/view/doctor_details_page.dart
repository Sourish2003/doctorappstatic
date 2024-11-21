import 'package:doctorappstatic/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/doctor_view_model.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button and title
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    const Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),

                const SizedBox(height: 24),

                // Doctor Profile Section
                Column(
                  children: [
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align items horizontally
                      children: [
                        // Doctor image with orange background
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange, // Add orange background
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('lib/assets/doctor_1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                            width: 16), // Add spacing between image and text

                        // Doctor details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dr. Albert Flores',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Cardiologist',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber, // Changed to amber for more accurate color
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text('(47)'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Stats row with dividers
                    IntrinsicHeight(
                      // This ensures dividers take full height
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStat('Patient', '320+'),
                          const VerticalDivider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildStat('Experience', '8 Years +'),
                          const VerticalDivider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          _buildStat('Rating', '4.7'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),


                // Date Selection
                Consumer<DoctorViewModel>(
                  builder: (context, viewModel, _) {
                    return SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.dates.length,
                        itemBuilder: (context, index) {
                          final date = viewModel.dates[index];
                          return GestureDetector(
                            onTap: () => viewModel.selectDate(index),
                            child: Container(
                              width: 60,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: viewModel.isDateSelected(index)
                                    ? Pallete.buttonColor
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    date.dayName,
                                    style: TextStyle(
                                      color: viewModel.isDateSelected(index)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '${date.date}',
                                    style: TextStyle(
                                      color: viewModel.isDateSelected(index)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),


                // Time Selection section
                const Text(
                  'Select Time',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    '03:00 PM',
                    '04:00 PM',
                    '05:00 PM',
                    '06:00 PM',
                    '07:00 PM',
                  ]
                      .map((time) => ChoiceChip(
                            label: Text(
                              time,
                              style: TextStyle(
                                color: time == '04:00 PM'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            selected: time == '04:00 PM',
                            onSelected: (selected) {},
                            selectedColor: Colors.blue,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(
                                color: time == '04:00 PM'
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ))
                      .toList(),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Biography',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Lorem ipsum',
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Consumer<DoctorViewModel>(
                    builder: (context, viewModel, child) {
                      return ElevatedButton(
                        onPressed: viewModel.isBooked
                            ? null
                            : () => viewModel.bookAppointment(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          viewModel.isBooked ? 'Booked' : 'Book Appointment',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
