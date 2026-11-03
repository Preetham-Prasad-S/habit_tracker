class CreateHabitEntity {
  final String title;
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
  });

  @override
  String toString() {
    return 'CreateHabitEntity(title: $title, color: $color, icon: $icon, frequency: $frequency, frequencyDates: $frequencyDates)';
  }
}
