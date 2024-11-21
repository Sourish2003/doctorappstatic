import 'package:flutter/material.dart';
import '../models/doctors.dart';

class DocCardWidget extends StatelessWidget {
  final Doctor doctor;

  const DocCardWidget({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      // padding: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Doctor Nearby'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/doctor-details');
                },
                child: const Text('See Details'),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(doctor.imageUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      doctor.specialization,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.work, size: 16, color: Colors.blue[400]),
                        const SizedBox(width: 8),
                        Text('${doctor.yearsExperience} years'),
                        const SizedBox(width: 8),
                        Icon(Icons.thumb_up, size: 16, color: Colors.blue[400]),
                        const SizedBox(width: 8),
                        Text('${doctor.satisfactionRate}%'),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
          const SizedBox(height: 12),

          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Fee',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\$${doctor.fee}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/doctor-details');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Make an Appointment'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}