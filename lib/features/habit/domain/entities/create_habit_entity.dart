class CreateHabitEntity {
  final String id;
  final String title;
  final String description;
  final int color;
  final int icon;
  final int frequency;
  final List<int> frequencyDates;

  CreateHabitEntity({
    required this.title,
    required this.color,
    required this.icon,
    required this.frequency,
    required this.frequencyDates,
    required this.description,
    required this.id,
  });

  @override
  String toString() {
    return 'CreateHabitEntity(id : $id ,title: $title, color: $color, icon: $icon, frequency: $frequency, frequencyDates: $frequencyDates, description : $description)';
  }
}
