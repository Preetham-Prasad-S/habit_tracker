import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/home/presentation/controllers/states/habit_state.dart';
import 'package:schedule_tracker/features/home/presentation/widgets/home_category_widget.dart';
import 'package:schedule_tracker/features/home/presentation/widgets/home_habit_widget.dart';
import 'package:schedule_tracker/features/home/presentation/widgets/home_header_widget.dart';
import 'package:schedule_tracker/features/home/presentation/widgets/home_status_card_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<HabitSuccessState> habits = [
    HabitSuccessState(
      title: "Upper Body Exercise",
      category: "Exercise",
      icon: Ionicons.fitness,
      status: HabitStatusState.pending,
      streak: 20,
      subText: "Do a full upper body workout",
    ),
    HabitSuccessState(
      title: "Morning Waking Up",
      category: "Exercise",
      icon: Ionicons.alarm,
      status: HabitStatusState.incomplete,
      streak: 2,
      subText: "Wake up at 6 am",
    ),
    HabitSuccessState(
      title: "Do Aptitute",
      category: "Exercise",
      icon: Ionicons.book,
      status: HabitStatusState.completed,
      streak: 2,
      subText: "Wake up at 6 am",
    ),
    HabitSuccessState(
      title: "Register For GATE Exam",
      category: "Study",
      icon: Ionicons.book,
      status: HabitStatusState.pending,
      streak: 2,
      subText: "Register for the examination.",
    ),
    HabitSuccessState(
      title: "Do Aptitute",
      category: "Exercise",
      icon: Ionicons.book,
      status: HabitStatusState.completed,
      streak: 2,
      subText: "Wake up at 6 am",
    ),
    HabitSuccessState(
      title: "Do Aptitute",
      category: "Exercise",
      icon: Ionicons.book,
      status: HabitStatusState.completed,
      streak: 2,
      subText: "Wake up at 6 am",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const HomeHeaderWidget(streakCount: 15),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const HomeStatusCardWidget(
                        completedTasks: 4,
                        totalTasks: 6,
                      ),
                      const SizedBox(height: 30),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            HomeCategoryWidget(
                              habitText: "All Habits",
                              selected: true,
                              habitCount: 4,
                            ),
                            HomeCategoryWidget(
                              habitText: "Morning",
                              selected: false,
                              habitCount: 1,
                            ),
                            HomeCategoryWidget(
                              habitText: "Evening",
                              selected: false,
                              habitCount: 5,
                            ),
                            HomeCategoryWidget(
                              habitText: "Study",
                              selected: false,
                              habitCount: 17,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // HomeHabitWidget(),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: habits.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          final habit = habits[index];

                          return HomeHabitWidget(
                            category: habit.category,
                            icon: habit.icon,
                            status: habit.status,
                            streak: habit.streak,
                            subText: habit.subText,
                            title: habit.title,
                          );
                        },
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          shape: CircleBorder(),
          child: Icon(
            Ionicons.add,
            fontWeight: FontWeight.w900,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
