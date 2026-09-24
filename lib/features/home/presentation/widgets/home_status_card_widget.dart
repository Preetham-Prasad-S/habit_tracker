import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/home/presentation/widgets/home_date_widget.dart';

class HomeStatusCardWidget extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;

  const HomeStatusCardWidget({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  String getDateDayMonth() {
    final dateTime = DateTime.now();
    final date = DateFormat("EEEE, MMM d").format(dateTime);

    return date;
  }

  int getDay(int index) {
    final dateTime = DateTime.now().add(Duration(days: index));
    return dateTime.day;
  }

  String getWeekDay(int index) {
    final dateTime = DateTime.now().add(Duration(days: index));
    return DateFormat("EEE").format(dateTime);
  }

  String getStatusText() {
    return "Great Momentum";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        side: BorderSide(color: AppColors.cardBorderColor, width: 1),
      ),
      margin: EdgeInsets.all(0),
      color: AppColors.whiteColor,
      elevation: 10,
      shadowColor: AppColors.cardShadowColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Ionicons.calendar_clear_outline,
                            fontWeight: FontWeight.bold,
                            size: 15,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          getDateDayMonth(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: AppColors.subTextColor,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Daily Momentum",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: CircularProgressIndicator(
                        value: 0.67,
                        strokeWidth: 5,
                        color: AppColors.primaryColor,
                        backgroundColor: AppColors.primaryBackdropColor,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Text(
                      "${((completedTasks / totalTasks) * 100).toInt()}%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$completedTasks out of $totalTasks completed today",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.subTextColor,
                  ),
                ),
                Text(
                  getStatusText(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: completedTasks / totalTasks,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              minHeight: 8,
              backgroundColor: AppColors.primaryBackdropColor,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 10),
            Divider(color: Color.fromARGB(255, 236, 236, 236), thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) =>
                    HomeDateWidget(day: getWeekDay(index), date: getDay(index)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
