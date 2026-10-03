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

    // database.execute("CREATE TABLE test(value INT)");

    database.insert('test', {"value": 30});

    final data = await database.query('test');

    // final text = await database.query("sqlite_master");

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            databaseFunction();
          },
          child: Text('Press Me', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
