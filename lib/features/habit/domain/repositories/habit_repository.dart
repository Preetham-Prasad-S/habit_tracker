import 'package:fpdart/fpdart.dart';
import 'package:schedule_tracker/core/error/app_failure.dart';
import 'package:schedule_tracker/core/success/success.dart';
import 'package:schedule_tracker/features/habit/domain/entities/create_habit_entity.dart';

abstract interface class HabitRepository {
  Future<Either<Success, AppFailure>> createHabit(CreateHabitEntity habit);
}
