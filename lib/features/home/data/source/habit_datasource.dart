import 'dart:convert';

abstract interface class HabitDatasource {
  List<void> getHabits();
}

class HabitModel {
  final String id;
  final String habitTitle;
  final String habitSubTitle;

  HabitModel({
    required this.id,
    required this.habitTitle,
    required this.habitSubTitle,
  });

  HabitModel copyWith({String? id, String? habitTitle, String? habitSubTitle}) {
    return HabitModel(
      id: id ?? this.id,
      habitTitle: habitTitle ?? this.habitTitle,
      habitSubTitle: habitSubTitle ?? this.habitSubTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'habitTitle': habitTitle, 'habitSubTitle': habitSubTitle};
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'] ?? '',
      habitTitle: map['habitTitle'] ?? '',
      habitSubTitle: map['habitSubTitle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HabitModel.fromJson(String source) =>
      HabitModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Habit(id: $id, habitTitle: $habitTitle, habitSubTitle: $habitSubTitle)';
}
