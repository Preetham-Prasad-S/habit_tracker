import 'dart:convert';

class HabitModel {
  final String id;
  final String title;
  final String descritption;
  final int color;
  final int icon;

  HabitModel({
    required this.id,
    required this.title,
    required this.descritption,
    required this.color,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'descritption': descritption,
      'color': color,
      'icon': icon,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      descritption: map['descritption'] ?? '',
      color: map['color']?.toInt() ?? 0,
      icon: map['icon']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitModel.fromJson(String source) =>
      HabitModel.fromMap(json.decode(source));
}
