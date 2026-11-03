import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

final class HabitColors {
  HabitColors._();

  static const Map<int, Color> habitColors = {
    0: Colors.blue,
    1: Colors.green,
    2: Colors.red,
    3: Colors.pink,
    4: Colors.purple,
    5: Colors.orange,
  };
}

final class HabitIcons {
  HabitIcons._();

  static const Map<int, IconData> habitIcons = {
    0: Ionicons.book_outline,
    1: Ionicons.barbell_outline,
    2: Ionicons.water_outline,
    3: Ionicons.bicycle_outline,
    4: Ionicons.code_outline,
    5: Ionicons.alarm_outline,
    6: Ionicons.bulb_outline,
    7: Ionicons.calendar_clear_outline,
    8: Ionicons.hourglass_outline,
    9: Ionicons.language_outline,
    10: Ionicons.water_outline,
    11: Ionicons.accessibility_outline,
  };
}

final class HabitFrequency {
  HabitFrequency._();

  static const Map<int, HabitFrequencyType> habitFrequencyType = {
    0: HabitFrequencyType.daily,
    1: HabitFrequencyType.weekly,
  };

  static const Map<int, String> habitFrequencyDays = {
    0: "Saturday",
    1: "Sunday",
    2: "Monday",
    3: "Tuesday",
    4: "Wednesday",
    5: "Thursday",
    6: "Friday",
  };
}

enum HabitFrequencyType { daily, weekly }
