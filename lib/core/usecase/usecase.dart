import 'package:fpdart/fpdart.dart';
import 'package:schedule_tracker/core/error/app_failure.dart';

abstract interface class Usecase<UsecaseType, UsecaseParams> {
  Future<Either<UsecaseType, AppFailure>> call();
}
