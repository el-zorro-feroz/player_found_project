import 'package:dartz/dartz.dart';
import 'package:player_found_project/core/failures/failure.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/core/usecase/usecase.dart';
import 'package:player_found_project/scr/domain/entities/player.dart';
import 'package:player_found_project/scr/domain/failures/player_failures.dart';
import 'package:player_found_project/scr/domain/repositories/player_repository.dart';
import 'package:player_found_project/scr/domain/validators/steam_id_validator.dart';

class GetConcretePlayerUseCase extends UseCase<Player, String> {
  @override
  Future<Either<Failure, Player>> call(String p) async {
    if (!(await SteamIdValidator().validate(p))) {
      return const Left(NotValidSteam64IDFailure());
    }

    return Injector.services.get<PlayerRepository>().read(id: p);
  }
}
