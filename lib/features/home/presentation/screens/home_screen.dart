import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/features/domain/entities/habit_entity.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<HabitEntity> habits = [
    HabitEntity(
      title: "Upper Body Exercise",
      category: "Exercise",
      icon: Ionicons.fitness,
      status: HabitStatus.pending,
      streak: 20,
      subText: "Do a full upper body workout",
    ),
    HabitEntity(
      title: "Morning Waking Up",
      category: "Exercise",
      icon: Ionicons.alarm,
      status: HabitStatus.incomplete,
      streak: 2,
      subText: "Wake up at 6 am",
    ),
    HabitEntity(
      title: "Do Aptitute",
      category: "Exercise",
      icon: Ionicons.book,
      status: HabitStatus.completed,
      streak: 2,
      subText: "Wake up at 6 am",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 249, 249),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeaderWidget(streakCount: 15),
                const SizedBox(height: 20),
                const HomeStatusCardWidget(completedTasks: 4, totalTasks: 6),
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
                  itemCount: habits.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
  final HabitStatus status;

  Color getStatusColor(HabitStatus status) {
    if (status == HabitStatus.completed) {
      return Colors.green;
    } else if (status == HabitStatus.incomplete) {
      return Colors.red;
    }
    return Colors.grey;
  }

  IoniconsData getStatusIcon(HabitStatus status) {
    if (status == HabitStatus.completed) {
      return Ionicons.checkmark;
    } else if (status == HabitStatus.incomplete) {
      return Ionicons.close;
    }
    return Ionicons.alert;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Color.fromARGB(255, 225, 225, 225)),
      ),
      elevation: 10,
      shadowColor: Color.fromARGB(92, 255, 255, 255),
      color: Colors.white,
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
                  color: Color.fromARGB(255, 255, 223, 125),
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(icon, color: Color.fromARGB(255, 177, 135, 8)),
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
                              color: Color.fromARGB(255, 125, 125, 125),
                            ),
                          ),
                        ),
                        Text(
                          "  ●  ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 209, 209, 209),
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Ionicons.flame,
                              size: 15,
                              color: Color(0xFFFF6B4A),
                            ),
                            Text(
                              " $streak days",
                              style: TextStyle(color: Color(0xFFFF6B4A)),
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
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        side: BorderSide(color: Color.fromARGB(255, 225, 225, 225), width: 1),
      ),
      margin: EdgeInsets.all(0),
      color: Colors.white,
      elevation: 10,
      shadowColor: const Color.fromARGB(92, 255, 255, 255),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            // Daily momentum with date and progress indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Daily momentum and date
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
                            color: Color(0xFFFF6B4A),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          getDateDayMonth(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Color.fromARGB(255, 109, 109, 109),
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
                // Percentage and text
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: CircularProgressIndicator(
                        value: 0.67,
                        strokeWidth: 5,
                        color: Color(0xFFFF6B4A),
                        backgroundColor: Color.fromARGB(255, 255, 234, 230),
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
            // No of task Completed And "Great Momentum" Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$completedTasks out of $totalTasks completed today",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 109, 109, 109),
                  ),
                ),
                Text(
                  getStatusText(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF6B4A),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            LinearProgressIndicator(
              value: completedTasks / totalTasks,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              minHeight: 8,
              backgroundColor: Color.fromARGB(255, 253, 232, 227),
              color: Color(0xFFFF6B4A),
            ),
            SizedBox(height: 10),
            Divider(color: Color.fromARGB(255, 236, 236, 236), thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) =>
                    DateWidget(day: getWeekDay(index), date: getDay(index)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                color: Color.fromARGB(53, 255, 107, 74),
                margin: EdgeInsets.all(0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Ionicons.flame, color: Color(0xFFFF6B4A)),
                ),
              ),
            ),
            Text(
              "Habit Tracker",
              style: TextStyle(
                color: Colors.black,
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
                  color: Color.fromARGB(95, 220, 220, 220),
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(Ionicons.flame, color: Color(0xFFFF6B4A)),
                        const SizedBox(width: 5),
                        Text(
                          "$streakCount",
                          style: TextStyle(
                            color: Color(0xFFFF6B4A),
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
                    color: Colors.black,
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

class HomeCategoryWidget extends StatelessWidget {
  final bool selected;
  final String habitText;
  final int habitCount;
  const HomeCategoryWidget({
    super.key,
    required this.selected,
    required this.habitText,
    required this.habitCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: selected
              ? Colors.transparent
              : const Color.fromARGB(255, 230, 230, 230),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: selected
          ? Color(0xFFFF6B4A)
          : const Color.fromARGB(255, 233, 233, 233),
      elevation: 0,
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "  ($habitCount)",
                style: GoogleFonts.outfit(
                  color: selected
                      ? Color.fromARGB(205, 255, 255, 255)
                      : const Color.fromARGB(129, 0, 0, 0),
                ),
              ),
            ],
            text: habitText,
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.w500,
              color: selected
                  ? Colors.white
                  : const Color.fromARGB(255, 70, 70, 70),
            ),
          ),
        ),
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final String day;
  final int date;
  const DateWidget({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: TextStyle(fontWeight: FontWeight.w600)),
        Card(
          color: Color(0xFFFF6B4A),
          elevation: 0,
          shape: CircleBorder(),
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "$date",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
