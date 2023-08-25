// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class SearchPlayerHomeState extends HomeState {
  bool showSnackBar;

  SearchPlayerHomeState({
    required this.showSnackBar,
  });

  // @override
  // List<Object> get props => [showSnackBar];
}

class ShowPlayerProfileHomeState extends HomeState {
  final Player player;

  const ShowPlayerProfileHomeState({
    required this.player,
  });
}
