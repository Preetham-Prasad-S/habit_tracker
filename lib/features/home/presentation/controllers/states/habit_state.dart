import 'package:flutter/material.dart';

class HabitSuccessState {
  final String category;
  final String title;
  final IconData icon;
  final String subText;
  final int streak;
  final HabitStatusState status;

  HabitSuccessState({
    required this.category,
    required this.title,
    required this.icon,
    required this.subText,
    required this.streak,
    required this.status,
  });
}

enum HabitStatusState { completed, pending, incomplete }
