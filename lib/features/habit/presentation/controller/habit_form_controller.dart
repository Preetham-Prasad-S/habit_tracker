import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_tracker/core/utils/habit_colors.dart';
import 'package:schedule_tracker/core/utils/habit_icons.dart';

class HabitFormController extends GetxController {
  final habitNameController = TextEditingController();
  final habitColors = HabitColors.habitColors;
  final habitIcons = HabitIcons.habitIcons;
  final selectedColor = 0.obs;
  final selectedIcon = 0.obs;

  @override
  void onClose() {
    habitNameController.dispose();
    super.onClose();
  }
}
