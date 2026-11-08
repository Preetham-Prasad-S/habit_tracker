import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_tracker/core/utils/helper.dart';
import 'package:schedule_tracker/features/habit/domain/entities/create_habit_entity.dart';
import 'package:uuid/uuid.dart';

class HabitFormController extends GetxController {
  final habitNameController = TextEditingController();
  final habitDescriptionController = TextEditingController();

  final habitColors = HabitColors.habitColors;
  final habitIcons = HabitIcons.habitIcons;
  final habitFrequencyType = HabitFrequency.habitFrequencyType;
  final habitFreqencyDays = HabitFrequency.habitFrequencyDays;

  final selectedColor = 0.obs;
  final selectedIcon = 0.obs;

  final selectedFrequencyType = 0.obs;
  final selectedFrequencyDays = <int>[].obs;

  final uuid = Uuid();

  void createHabit() {
    final newhabit = CreateHabitEntity(
      id: uuid.v7(),
      title: habitNameController.text.trim(),
      description: habitDescriptionController.text.trim(),
      color: selectedColor.value,
      icon: selectedIcon.value,
      frequency: selectedFrequencyType.value,
      frequencyDates: selectedFrequencyDays,
    );
  }

  @override
  void onClose() {
    habitNameController.dispose();
    habitDescriptionController.dispose();
    super.onClose();
  }
}
