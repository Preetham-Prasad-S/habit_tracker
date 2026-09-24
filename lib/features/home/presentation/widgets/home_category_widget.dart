import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';

class HomeCategoryWidget extends StatelessWidget {
  final bool selected;
  final String habitText;
  final int habitCount;
  const HomeCategoryWidget({
    super.key,
    required this.selected,
    required this.habitText,
    required this.habitCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: selected
              ? AppColors.transperantColor
              : AppColors.cardBorderColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: selected
          ? AppColors.primaryColor
          : AppColors.greyBackdropColorLight,
      elevation: 0,
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "  ($habitCount)",
                style: GoogleFonts.outfit(
                  color: selected
                      ? AppColors.whiteColor
                      : AppColors.greyBackdropColorDark,
                ),
              ),
            ],
            text: habitText,
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w500,
              color: selected
                  ? AppColors.whiteColor
                  : AppColors.greyBackdropColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
