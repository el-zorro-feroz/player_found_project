import 'package:dartz/dartz.dart';
import 'package:player_found_project/core/failures/failure.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/data/datasource/steam_datasource.dart';
import 'package:player_found_project/scr/data/failures/player_failure.dart';
import 'package:player_found_project/scr/data/models/player_model.dart';
import 'package:player_found_project/scr/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl extends PlayerRepository {
  final SteamDatasource steamDatasource = Injector.services.get<SteamDatasource>();

  @override
  Future<Either<Failure, PlayerModel>> read({required String id}) async {
    try {
      return Right(await steamDatasource.getModelByID64(id));
    } catch (_) {
      return const Left(PlayerFailure());
    }
  }
}
