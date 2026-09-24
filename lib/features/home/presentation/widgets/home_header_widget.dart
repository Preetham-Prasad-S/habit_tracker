import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';

class HomeHeaderWidget extends StatelessWidget {
  final int streakCount;
  const HomeHeaderWidget({super.key, required this.streakCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                elevation: 0,
                color: AppColors.primaryBackdropColor,
                margin: EdgeInsets.all(0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Ionicons.flame, color: AppColors.primaryColor),
                ),
              ),
            ),
            Text(
              "Habit Tracker",
              style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  elevation: 0,
                  color: AppColors.greyBackdropColorLight,
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Ionicons.flame,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "$streakCount",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    color: AppColors.blackColor,
                    Ionicons.sunny_outline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
