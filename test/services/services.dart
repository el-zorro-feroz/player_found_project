import 'dart:async';

import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/domain/repositories/player_repository.dart';
import 'package:player_found_project/scr/domain/usecases/get_concrete_player_usecase.dart';
import 'arrgange/mock_player_repository.dart';

FutureOr<void> initMockServices() async {
  // Repository
  Injector.services.registerLazySingleton<PlayerRepository>(() => arrangeMockPlayerRepository());

  // Use Case
  Injector.services.registerLazySingleton<GetConcretePlayerUseCase>(() => GetConcretePlayerUseCase());
}
