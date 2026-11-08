import 'package:schedule_tracker/core/success/success.dart';
import 'package:schedule_tracker/features/habit/data/models/habit_model.dart';
import 'package:schedule_tracker/features/habit/data/source/habit_datasource.dart';
import 'package:sqflite/sqflite.dart';

class HabitLocalDatasourceImpl implements HabitDatasource {
  final Database _database;

  HabitLocalDatasourceImpl({required Database database}) : _database = database;

  @override
  Future<Data> createHabit(HabitModel habitModel) {
    throw UnimplementedError();
  }
}
