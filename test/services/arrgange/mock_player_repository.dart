import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:player_found_project/scr/domain/entities/player.dart';
import 'package:player_found_project/scr/domain/failures/player_failures.dart';

import '../../mock/repositories.mocks.dart';
import '../../validators/steam_id_validator_test.dart';

MockPlayerRepository arrangeMockPlayerRepository() {
  final mock = MockPlayerRepository();

  when(
    mock.read(id: correctSteamID),
  ).thenAnswer(
    (_) async => const Right(
      Player(
        id: 'id',
        username: 'username',
        userProfileLink: 'userProfileLink',
        userAvatarLink: 'userAvatarLink',
      ),
    ),
  );

  when(
    mock.read(id: incorrectSteamID),
  ).thenAnswer(
    (_) async => const Left(
      NotValidSteam64IDFailure(),
    ),
  );

  return mock;
}
