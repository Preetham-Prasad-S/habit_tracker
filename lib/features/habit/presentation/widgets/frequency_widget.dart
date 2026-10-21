import 'package:flutter/material.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/section_title_widget.dart';

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
