import 'package:equatable/equatable.dart';

/// Failure
///
/// Abstract class that defines a generic failure
abstract class Failure extends Equatable {}

//! General Failure
/// ServerFailure
///
/// Concrete implementation of Failure to handle errors
class ServerFailure extends Failure {
  final String message;
  ServerFailure(
    this.message,
  );

  @override
  List<Object?> get props => [message];
}
