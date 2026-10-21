import 'package:flutter/material.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';

class SectionTitleTextWidget extends StatelessWidget {
  final String text;
  const SectionTitleTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: TextStyle(color: AppColors.greyBackdropColorDark),
      ),
    );
  }
}
