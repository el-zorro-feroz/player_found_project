import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:player_found_project/core/failures/failure.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/domain/entities/player.dart';
import 'package:player_found_project/scr/domain/failures/player_failures.dart';
import 'package:player_found_project/scr/domain/repositories/player_repository.dart';
import 'package:player_found_project/scr/domain/usecases/get_concrete_player_usecase.dart';

import '../services/services.dart';
import '../validators/steam_id_validator_test.dart';

void main() async {
  await initMockServices();

  group('Get Councrete Player Use Case', () {
    test('Correct call test', () async {
      // Act
      final PlayerRepository playerRepository = Injector.services<PlayerRepository>();
      final GetConcretePlayerUseCase getConcretePlayerUseCase = Injector.services<GetConcretePlayerUseCase>();

      // Arrange
      final Either<Failure, Player> failOrPlayer = await getConcretePlayerUseCase.call(correctSteamID);

      // Assert
      expect(failOrPlayer.isRight(), true);
      verify(playerRepository.read(id: correctSteamID)).called(1);
      verifyNoMoreInteractions(playerRepository);
    });

    test(
      'Incorrect call test',
      () async {
        // Act
        final PlayerRepository playerRepository = Injector.services<PlayerRepository>();
        final GetConcretePlayerUseCase getConcretePlayerUseCase = Injector.services<GetConcretePlayerUseCase>();

        // Arrange
        final Either<Failure, Player> failOrPlayer = await getConcretePlayerUseCase.call(incorrectSteamID);
        final bool assertResult = failOrPlayer.fold(
          (Failure failure) {
            return (failure is NotValidSteam64IDFailure);
          },
          (Player player) {
            return false;
          },
        );

        // Assert
        expect(assertResult, true);
        verifyZeroInteractions(playerRepository);
      },
    );
  });
}
