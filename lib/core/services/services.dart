import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:player_found_project/scr/data/datasource/steam_datasource.dart';
import 'package:player_found_project/scr/data/repository/player_repository_impl.dart';
import 'package:player_found_project/scr/domain/repositories/player_repository.dart';
import 'package:player_found_project/scr/domain/usecases/get_concrete_player_usecase.dart';
import 'package:player_found_project/scr/presentation/src/bloc/home_bloc.dart';

class Injector {
  static GetIt services = GetIt.I;

  Future<void> initService() async {
    // Datasource
    services.registerLazySingleton<SteamDatasource>(() => SteamDatasource());

    // Repository
    services.registerLazySingleton<PlayerRepository>(() => PlayerRepositoryImpl());

    // Use Case
    services.registerLazySingleton<GetConcretePlayerUseCase>(() => GetConcretePlayerUseCase());

    // BLoC
    services.registerLazySingleton<HomeBloc>(() => HomeBloc());
  }
}
