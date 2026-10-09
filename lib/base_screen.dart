import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:schedule_tracker/habit_form_screen.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final RxInt selectedPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 249, 249),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(
            () => IndexedStack(
              index: selectedPage.value,
              children: [HomeScreen()],
            ),
          ),
          SizedBox(
            height: 125,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: BottomNavigationBarWidget(selectedIndex: selectedPage),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => HabitFormScreen())),
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

class BottomNavigationBarWidget extends StatelessWidget {
  final RxInt selectedIndex;
  const BottomNavigationBarWidget({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: const Color.fromARGB(92, 255, 255, 255),
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color.fromARGB(255, 225, 225, 225)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavigationButtonWidget(
                isSelected: selectedIndex.value == 0,
                text: "Home",
                icon: Ionicons.home_outline,
                onPressed: () => selectedIndex.value = 0,
              ),
              BottomNavigationButtonWidget(
                isSelected: selectedIndex.value == 1,
                text: "Habits",
                icon: Ionicons.checkmark_circle_outline,
                onPressed: () => selectedIndex.value = 1,
              ),
              BottomNavigationButtonWidget(
                isSelected: selectedIndex.value == 2,
                text: "Stats",
                icon: Ionicons.stats_chart_outline,
                onPressed: () => selectedIndex.value = 2,
              ),
              BottomNavigationButtonWidget(
                isSelected: selectedIndex.value == 3,
                text: "Settings",
                icon: Ionicons.settings_outline,
                onPressed: () => selectedIndex.value = 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationButtonWidget extends StatefulWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const BottomNavigationButtonWidget({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  State<BottomNavigationButtonWidget> createState() =>
      _BottomNavigationButtonWidgetState();

  // bool selected = widegt.isSelected;
}

class _BottomNavigationButtonWidgetState
    extends State<BottomNavigationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        elevation: WidgetStatePropertyAll(0),
        foregroundColor: WidgetStatePropertyAll(
          widget.isSelected ? Colors.white : Colors.black,
        ),
        backgroundColor: WidgetStatePropertyAll(
          widget.isSelected ? Color(0xFFFF6B4A) : Colors.white,
        ),
      ),
      onPressed: () => widget.onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Icon(widget.icon, size: 20),
            Text(
              widget.text,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
