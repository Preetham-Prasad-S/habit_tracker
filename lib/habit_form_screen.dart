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
                      FrequencyWidget(),
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

class FrequencyWidget extends StatelessWidget {
  const FrequencyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column();
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
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "CHOOSE COLOR & ICON",
            style: TextStyle(color: AppColors.greyBackdropColorDark),
          ),
        ),
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
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "HABIT NAME",
            style: TextStyle(color: AppColors.greyBackdropColorDark),
          ),
        ),
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
