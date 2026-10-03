import 'package:schedule_tracker/features/home/data/source/habit_datasource.dart';
import 'package:sqflite/sqlite_api.dart';

class HabitDatasourceImpl implements HabitDatasource {
  final Database _database;

  HabitDatasourceImpl({required Database database}) : _database = database;

  @override
  List<void> getHabits() {
    // TODO: implement getHabits
    throw UnimplementedError();
  }
}
