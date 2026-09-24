import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  void databaseFunction() async {
    final databasePath = await getDatabasesPath();
    final database = await openDatabase("test.db");

    

    print(databasePath);
    print(database);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => databaseFunction(),
          child: Text('Press Me', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
