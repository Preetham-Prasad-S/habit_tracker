import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/habit/presentation/widgets/section_title_widget.dart';

class HabitColorIconWidget extends StatefulWidget {
  const HabitColorIconWidget({super.key});

  @override
  State<HabitColorIconWidget> createState() => _HabitColorIconWidgetState();
}

class _HabitColorIconWidgetState extends State<HabitColorIconWidget> {
  int _selectedColor = 0;

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
                    (index) => GestureDetector(
                      onTap: () => setState(() {
                        _selectedColor = index;
                      }),
                      child: Card(
                        elevation: 0,
                        color: AppColors.whiteColor,
                        shape: _selectedColor == index
                            ? CircleBorder(
                                side: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 3,
                                ),
                              )
                            : null,
                        margin: EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(4.5),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: _habitColors[index],
                            ),
                            child: _selectedColor == index
                                ? Icon(
                                    Ionicons.checkmark_outline,
                                    color: AppColors.whiteColor,
                                  )
                                : null,
                          ),
                        ),
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
