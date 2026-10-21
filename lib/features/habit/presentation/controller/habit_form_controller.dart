import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HabitFormController extends GetxController {
  final habitNameController = TextEditingController();
  var selectedColor = 0.obs;

  @override
  void onClose() {
    habitNameController.dispose();
    super.onClose();
  }
}
