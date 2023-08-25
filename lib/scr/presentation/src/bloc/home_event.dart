part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class SearchPlayerHomeEvent extends HomeEvent {
  final String id;

  const SearchPlayerHomeEvent({
    required this.id,
  });
}

final class ShowPlayerProfileHomeEvent extends HomeEvent {}

final class BackToSearchPlayerHomeEvent extends HomeEvent {}
