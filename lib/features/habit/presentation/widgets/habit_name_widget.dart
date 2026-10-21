import 'package:flutter/material.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/section_title_widget.dart';

class HabitNameWidget extends StatelessWidget {
  const HabitNameWidget({super.key, required this.habitNameTextController});
  final TextEditingController habitNameTextController;

  OutlineInputBorder _border(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleTextWidget(text: "HABIT NAME"),
        const SizedBox(height: 5),
        Card(
          elevation: 10,
          shadowColor: AppColors.cardShadowColor,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: "Study, Workout, Drink Water.......",
              hintStyle: TextStyle(color: AppColors.greyBackdropColorMedium),
              fillColor: AppColors.whiteColor,
              enabledBorder: _border(AppColors.cardBorderColor),
              focusedBorder: _border(AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
