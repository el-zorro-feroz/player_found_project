import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:player_found_project/core/failures/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P p);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
