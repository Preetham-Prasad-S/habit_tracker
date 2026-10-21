import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/habit/presentation/controller/habit_form_controller.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/frequency_widget.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/habit_color_icon_widget.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/habit_name_widget.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/header_widget.dart';

class HabitFormScreen extends StatelessWidget {
  HabitFormScreen({super.key});

  final HabitFormController habitFormController = Get.put(
    HabitFormController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HabitNameWidget(
                        habitNameTextController:
                            habitFormController.habitNameController,
                      ),
                      const SizedBox(height: 20),
                      const HabitColorIconWidget(),
                      const SizedBox(height: 20),
                      const FrequencyWidget(),
                      const SizedBox(height: 20),
                      // const ReminderWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
