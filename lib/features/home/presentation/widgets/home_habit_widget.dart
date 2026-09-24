import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/home/presentation/controllers/states/habit_state.dart';

class HomeHabitWidget extends StatelessWidget {
  const HomeHabitWidget({
    super.key,
    required this.category,
    required this.title,
    required this.icon,
    required this.subText,
    required this.streak,
    required this.status,
  });

  final String category;
  final String title;
  final IconData icon;
  final String subText;
  final int streak;
  final HabitStatusState status;

  Color getStatusColor(HabitStatusState status) {
    if (status == HabitStatusState.completed) {
      return AppColors.greenColor;
    } else if (status == HabitStatusState.incomplete) {
      return AppColors.redColor;
    }
    return AppColors.yellowColor;
  }

  IoniconsData getStatusIcon(HabitStatusState status) {
    if (status == HabitStatusState.completed) {
      return Ionicons.checkmark;
    } else if (status == HabitStatusState.incomplete) {
      return Ionicons.close;
    }
    return Ionicons.alert;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.cardBorderColor),
      ),
      elevation: 10,
      shadowColor: AppColors.cardShadowColor,
      color: AppColors.whiteColor,
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Card(
                  elevation: 0,
                  color: AppColors.blackColor,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(icon, color: AppColors.whiteColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            subText,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.subTextColor,
                            ),
                          ),
                        ),
                        Text(
                          "●  ",
                          style: TextStyle(
                            color: AppColors.greyBackdropColorMedium,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Ionicons.flame,
                              size: 15,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              " $streak days",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Card(
              elevation: 0,
              color: getStatusColor(status),
              margin: EdgeInsets.all(10),
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  getStatusIcon(status),
                  fontWeight: FontWeight.w900,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
