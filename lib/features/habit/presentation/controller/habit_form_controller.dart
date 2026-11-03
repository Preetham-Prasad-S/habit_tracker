import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_tracker/core/utils/helper.dart';
import 'package:schedule_tracker/features/habit/domain/entities/create_habit_entity.dart';

class HabitFormController extends GetxController {
  final habitNameController = TextEditingController();
  final habitColors = HabitColors.habitColors;
  final habitIcons = HabitIcons.habitIcons;
  final habitFrequencyType = HabitFrequency.habitFrequencyType;
  final habitFreqencyDays = HabitFrequency.habitFrequencyDays;

  final selectedColor = 0.obs;
  final selectedIcon = 0.obs;

  final selectedFrequencyType = 0.obs;
  final selectedFrequencyDays = <int>[].obs;

  void createHabit() {
    final newhabit = CreateHabitEntity(
      title: habitNameController.text.trim(),
      color: selectedColor.value,
      icon: selectedIcon.value,
      frequency: selectedFrequencyType.value,
      frequencyDates: selectedFrequencyDays,
    );
  }

  @override
  void onClose() {
    habitNameController.dispose();
    super.onClose();
  }
}
