import 'package:fpdart/src/either.dart';
import 'package:schedule_tracker/core/error/app_failure.dart';
import 'package:schedule_tracker/core/success/success.dart';
import 'package:schedule_tracker/features/habit/domain/entities/create_habit_entity.dart';
import 'package:schedule_tracker/features/habit/domain/repositories/habit_repository.dart';

class HabitRepositoryImpl implements HabitRepository {
  @override
  Future<Either<Success, AppFailure>> createHabit(CreateHabitEntity habit) {
    // TODO: implement createHabit
    throw UnimplementedError();
  }
}
