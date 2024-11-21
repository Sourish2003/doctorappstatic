class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String imageUrl;
  final double rating;
  final int yearsExperience;
  final int satisfactionRate;
  final double fee;
  final String biography;
  final int totalPatients;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.imageUrl,
    required this.rating,
    required this.yearsExperience,
    required this.satisfactionRate,
    required this.fee,
    required this.biography,
    required this.totalPatients,
  });
}
