import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/domain/entities/player.dart';
import 'package:player_found_project/scr/domain/usecases/get_concrete_player_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(SearchPlayerHomeState(showSnackBar: false)) {
    on<HomeEvent>((event, emit) {});
    on<SearchPlayerHomeEvent>(_onSearchPlayerHomeEvent);
    on<BackToSearchPlayerHomeEvent>(_onBackToSearchPlayerHomeEvent);
  }

  FutureOr<void> _onSearchPlayerHomeEvent(
    SearchPlayerHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    final getConcretePlayerUseCase = Injector.services.get<GetConcretePlayerUseCase>();
    final failureOrResult = await getConcretePlayerUseCase.call(event.id);
    failureOrResult.fold((l) {
      (state as SearchPlayerHomeState).showSnackBar = true;
    }, (r) {
      emit(ShowPlayerProfileHomeState(player: r));
    });
  }

  FutureOr<void> _onBackToSearchPlayerHomeEvent(
    BackToSearchPlayerHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(SearchPlayerHomeState(showSnackBar: false));
  }
}
