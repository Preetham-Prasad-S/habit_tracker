import 'dart:convert';

abstract interface class HabitDatasource {
  List<Habit> getHabits();
}

class Habit {
  final String id;
  final String habitTitle;
  final String habitSubTitle;

  Habit({
    required this.id,
    required this.habitTitle,
    required this.habitSubTitle,
  });

  Habit copyWith({String? id, String? habitTitle, String? habitSubTitle}) {
    return Habit(
      id: id ?? this.id,
      habitTitle: habitTitle ?? this.habitTitle,
      habitSubTitle: habitSubTitle ?? this.habitSubTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'habitTitle': habitTitle, 'habitSubTitle': habitSubTitle};
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'] ?? '',
      habitTitle: map['habitTitle'] ?? '',
      habitSubTitle: map['habitSubTitle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source));

  @override
  String toString() =>
      'Habit(id: $id, habitTitle: $habitTitle, habitSubTitle: $habitSubTitle)';
}
