import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/section_title_widget.dart';


class ReminderWidget extends StatefulWidget {
  const ReminderWidget({super.key});

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  bool _swtichStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleTextWidget(text: "DAILY REMINDER OPTIONAL"),
        const SizedBox(height: 10),
        Card(
          color: AppColors.whiteColor,
          elevation: 10,
          shadowColor: AppColors.cardShadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: AppColors.cardBorderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Card(
                  elevation: 0,
                  color: AppColors.primaryBackdropColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Ionicons.alarm,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("08:30 AM", style: TextStyle(fontSize: 20)),
                    Text(
                      "Reminder Alarm",
                      style: TextStyle(color: AppColors.greyBackdropColorDark),
                    ),
                  ],
                ),
                const Spacer(),
                Switch(
                  activeThumbColor: AppColors.primaryColor,
                  thumbColor: WidgetStatePropertyAll(AppColors.whiteColor),
                  activeTrackColor: AppColors.primaryColor,

                  trackOutlineWidth: WidgetStatePropertyAll(1),
                  trackOutlineColor: WidgetStatePropertyAll(
                    AppColors.transperantColor,
                  ),
                  value: _swtichStatus,
                  onChanged: (value) {
                    setState(() {
                      _swtichStatus = !_swtichStatus;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
