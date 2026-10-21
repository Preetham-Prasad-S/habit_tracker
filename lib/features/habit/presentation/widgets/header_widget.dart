import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Ionicons.arrow_back),
        ),
        Text(
          "New Habit",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        TextButton(
          style: TextButton.styleFrom(overlayColor: AppColors.primaryColor),
          onPressed: () {},
          child: Text(
            "Save",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
