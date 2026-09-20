import 'package:flutter/material.dart';

class HabitEntity {
  final String category;
  final String title;
  final IconData icon; // TODO Change the data type remember
  final String subText;
  final int streak;
  final HabitStatus status;

  HabitEntity({
    required this.category,
    required this.title,
    required this.icon,
    required this.subText,
    required this.streak,
    required this.status,
  });
}

enum HabitStatus { completed, pending, incomplete }
