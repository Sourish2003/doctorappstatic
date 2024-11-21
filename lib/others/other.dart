// // Updated DoctorsPage Categories Section
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import '../view_model/doctor_provider.dart';
// import '../models/category.dart';
// import '../widgets/doc_card.dart';
//
// class DoctorsPage extends StatelessWidget {
//   const DoctorsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Doctor\nAppointment',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF2D3142),
//                   height: 1.2,
//                 ),
//               ),
//               const SizedBox(height: 24),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search Doctor',
//                   hintStyle: const TextStyle(
//                     color: Color(0xFF9397A0),
//                   ),
//                   suffixIcon: Container(
//                     margin: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF247CFF),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Icon(
//                       Icons.search,
//                       color: Colors.white,
//                     ),
//                   ),
//                   filled: true,
//                   fillColor: const Color(0xFFF7F7F9),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide.none,
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 16,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Text(
//                 'Categories',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF2D3142),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 100,
//                 child: Consumer<HomeViewProvider>(
//                   builder: (context, provider, _) {
//                     return ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: provider.categories.length,
//                       itemBuilder: (context, index) {
//                         final category = provider.categories[index];
//                         final bool isSelected = index == 0;
//                         return Container(
//                           width: 80,
//                           margin: const EdgeInsets.only(right: 12),
//                           decoration: BoxDecoration(
//                             color: isSelected
//                                 ? const Color(0xFF247CFF)
//                                 : const Color(0xFFF7F7F9),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset(
//                                 category.iconPath,
//                                 width: 32,
//                                 height: 32,
//                                 colorFilter: ColorFilter.mode(
//                                   isSelected
//                                       ? Colors.white
//                                       : const Color(0xFF2D3142),
//                                   BlendMode.srcIn,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 category.name,
//                                 style: TextStyle(
//                                   color: isSelected
//                                       ? Colors.white
//                                       : const Color(0xFF2D3142),
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               // Rest of the code remains the same...
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Updated DoctorDetailsPage
// class DoctorDetailsPage extends StatelessWidget {
//   const DoctorDetailsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back button and title
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                     const Text(
//                       'Details',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Doctor Profile Section
//                 Center(
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 100,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.orange,
//                           image: const DecorationImage(
//                             image: AssetImage('assets/doctor_1.jpg'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Dr. Albert Flores',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       const Text(
//                         'Cardiologist',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: List.generate(
//                               5,
//                                   (index) => const Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                                 size: 20,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           const Text('(47)'),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//
//                       // Stats Row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           _buildStat('Patient', '320+'),
//                           _buildStat('Experience', '8 Years +'),
//                           _buildStat('Rating', '4.7'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//
//                 // Date Selection
//                 const Text(
//                   'Select Date',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Rest of the code for date selection, time selection,
//                 // and biography remains the same...
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStat(String label, String value) {
//     return Column(
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             color: Colors.grey,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//       ],
//     );
//   }
// }