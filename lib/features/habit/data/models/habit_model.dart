import 'dart:convert';

class HabitModel {
  final String title;
  final int color;
  final int icon;
  final int frequency;
  final List<int> frequencyDates;

  HabitModel({
    required this.title,
    required this.color,
    required this.icon,
    required this.frequency,
    required this.frequencyDates,
  });

  @override
  String toString() {
    return 'HabitModel(title: $title, color: $color, icon: $icon, frequency: $frequency, frequencyDates: $frequencyDates)';
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'color': color,
      'icon': icon,
      'frequency': frequency,
      'frequencyDates': frequencyDates,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      title: map['title'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
      frequency: map['frequency']?.toInt() ?? 0,
      frequencyDates: List<int>.from(map['frequencyDates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitModel.fromJson(String source) =>
      HabitModel.fromMap(json.decode(source));
}
