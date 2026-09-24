import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:schedule_tracker/core/utils/app_colors.dart';
import 'package:schedule_tracker/features/home/presentation/screens/home_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 249, 249),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(index: 0, children: [HomeScreen()]),
          SizedBox(
            height: 125,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: BottomNavigationBarWidget(),
            ),
          ),
        ],
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

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationButtonWidget(
              isSelected: true,
              text: "Home",
              icon: Ionicons.home_outline,
            ),
            BottomNavigationButtonWidget(
              isSelected: false,
              text: "Habits",
              icon: Ionicons.checkmark_circle_outline,
            ),
            BottomNavigationButtonWidget(
              isSelected: false,
              text: "Stats",
              icon: Ionicons.stats_chart_outline,
            ),
            BottomNavigationButtonWidget(
              isSelected: false,
              text: "Settings",
              icon: Ionicons.settings_outline,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationButtonWidget extends StatefulWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  const BottomNavigationButtonWidget({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.text,
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
      onPressed: () => setState(() {}),
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
