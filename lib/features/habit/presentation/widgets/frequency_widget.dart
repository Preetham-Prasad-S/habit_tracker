import 'package:flutter/material.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/section_title_widget.dart';

class FrequencyWidget extends StatefulWidget {
  const FrequencyWidget({super.key});

  @override
  State<FrequencyWidget> createState() => _FrequencyWidgetState();
}

class _FrequencyWidgetState extends State<FrequencyWidget> {
  int selectedType = 0;

  List<int> selectedDays = [];

  final List<String> availableDays = const ["S", "S", "M", "T", "W", "T", "F"];

  final List<String> frequencyTypes = const ["Daily", "Weekly"];

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
                              selectedType = index;
                              if (selectedType == 0) {
                                selectedDays.clear();
                              }
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedType == index
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
                                    color: selectedType == index
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
                AvailableDaysWidget(
                  selecteDays: selectedDays,
                  availableDays: availableDays,
                  selectedType: selectedType,
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

class AvailableDaysWidget extends StatefulWidget {
  const AvailableDaysWidget({
    super.key,
    required this.availableDays,
    required this.selectedType,
    required this.selecteDays,
  });

  final List<int> selecteDays;
  final List<String> availableDays;
  final int selectedType;

  @override
  State<AvailableDaysWidget> createState() => _AvailableDaysWidgetState();
}

class _AvailableDaysWidgetState extends State<AvailableDaysWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        widget.availableDays.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              if (widget.selectedType != 0) {
                if (widget.selecteDays.contains(index)) {
                  widget.selecteDays.remove(index);
                } else {
                  widget.selecteDays.add(index);
                }
              }
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.selectedType != 0
                  ? widget.selecteDays.contains(index)
                        ? AppColors.primaryColor
                        : AppColors.greyBackdropColorMedium
                  : AppColors.primaryColor,
            ),
            alignment: Alignment.center,
            child: Text(
              widget.availableDays[index],
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
