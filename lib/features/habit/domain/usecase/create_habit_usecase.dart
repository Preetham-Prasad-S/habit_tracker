import 'package:fpdart/src/either.dart';
import 'package:schedule_tracker/core/error/app_failure.dart';
import 'package:schedule_tracker/core/success/success.dart';
import 'package:schedule_tracker/core/usecase/usecase.dart';
import 'package:schedule_tracker/features/habit/domain/entities/create_habit_entity.dart';

class CreateHabitUsecase implements Usecase<Success, CreateHabitUsecaseParams> {
  @override
  Future<Either<Success, AppFailure>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class CreateHabitUsecaseParams {
  final CreateHabitEntity params;

  CreateHabitUsecaseParams({required this.params});
}
