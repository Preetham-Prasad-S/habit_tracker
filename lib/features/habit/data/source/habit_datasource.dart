import 'package:schedule_tracker/core/success/success.dart';
import 'package:schedule_tracker/features/habit/data/models/habit_model.dart';

abstract interface class HabitDatasource {
  Future<Data> createHabit(HabitModel habitModel);
}
