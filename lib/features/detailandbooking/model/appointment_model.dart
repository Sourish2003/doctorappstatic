class AppointmentModel {
  final DateTime date;
  final String time;
  final bool isSelected;

  AppointmentModel({
    required this.date,
    required this.time,
    this.isSelected = false,
  });
}
