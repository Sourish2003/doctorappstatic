class DateModel {
  final String dayName;
  final int date;
  final bool isSelected;

  DateModel({
    required this.dayName,
    required this.date,
    this.isSelected = false,
  });
}