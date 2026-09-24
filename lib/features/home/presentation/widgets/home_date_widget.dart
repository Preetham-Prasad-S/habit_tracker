import 'package:flutter/material.dart';

class HomeDateWidget extends StatelessWidget {
  final String day;
  final int date;
  const HomeDateWidget({super.key, required this.day, required this.date});

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
