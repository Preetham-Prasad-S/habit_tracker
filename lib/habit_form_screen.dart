import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';

class HabitFormScreen extends StatelessWidget {
  const HabitFormScreen({super.key});

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
                      const HabitNameWidget(),
                      const SizedBox(height: 20),
                      const HabitColorIconWidget(),
                      const SizedBox(height: 20),
                      const FrequencyWidget(),
                      const SizedBox(height: 20),
                      const ReminderWidget(),
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

class FrequencyWidget extends StatefulWidget {
  const FrequencyWidget({super.key});

  @override
  State<FrequencyWidget> createState() => _FrequencyWidgetState();
}

class _FrequencyWidgetState extends State<FrequencyWidget> {
  int selectedIndex = 0;

  final List<String> selectedDays = const ["S", "S", "M", "T", "W", "T", "F"];

  final List<String> frequencyTypes = const ["Daily", "Weekly", "Custom"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleTextWidget(text: "FREQUENCY"),
        Card(
          shadowColor: AppColors.cardShadowColor,
          color: AppColors.whiteColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: AppColors.cardBorderColor),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: AppColors.greyBackdropColorLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Row(
                      children: List.generate(
                        frequencyTypes.length,
                        (index) => Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              height: 40,

                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  frequencyTypes[index],
                                  style: TextStyle(
                                    color: selectedIndex == index
                                        ? AppColors.whiteColor
                                        : AppColors.greyBackdropColorDark,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const Text("Only on these days"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    selectedDays.length,
                    (index) => Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        selectedDays[index],
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HabitColorIconWidget extends StatelessWidget {
  const HabitColorIconWidget({super.key});

  final List<Color> _habitColors = const [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleTextWidget(text: 'CHOOSE COLOR & ICON'),
        const SizedBox(height: 5),
        Card(
          shadowColor: AppColors.cardShadowColor,
          elevation: 10,
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.cardBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 10,
                  children: List.generate(
                    _habitColors.length,
                    (index) => Container(
                      height: 35,
                      width: 35,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: _habitColors[index],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) => Card(
                    elevation: 0,
                    color: AppColors.greyBackdropColorLight,
                    child: Icon(Ionicons.code_working),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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

class HabitNameWidget extends StatelessWidget {
  const HabitNameWidget({super.key});

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

class PeriodSelector extends StatefulWidget {
  const PeriodSelector({super.key});

  @override
  State<PeriodSelector> createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> {
  final List<String> periods = ['Daily', 'Weekly'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F1F6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(periods.length, (index) {
          final isSelected = selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFFF684A)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  periods[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF352B35),
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
