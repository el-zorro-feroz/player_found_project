import 'package:dartz/dartz.dart';
import 'package:player_found_project/core/failures/failure.dart';
import 'package:player_found_project/scr/domain/entities/player.dart';

abstract class PlayerRepository {
  Future<Either<Failure, Player>> read({required String id});
}
