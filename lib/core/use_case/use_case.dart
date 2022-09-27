import 'package:crypto_app/core/error/error.dart';
import 'package:dartz/dartz.dart';

/// UseCase
///
/// Base class for use cases in order to let the use case decide which type returns
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
