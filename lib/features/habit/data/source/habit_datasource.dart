import 'package:schedule_tracker/core/success/success.dart';

abstract interface class HabitDatasource {
  Future<Data> createHabit();
}
