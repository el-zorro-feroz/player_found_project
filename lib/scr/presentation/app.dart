import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/presentation/src/bloc/home_bloc.dart';
import 'package:player_found_project/scr/presentation/src/pages/failure_page.dart';
import 'package:player_found_project/scr/presentation/src/pages/player_profile_page.dart';
import 'package:player_found_project/scr/presentation/src/pages/search_page.dart';

class App extends StatelessWidget {
  App({super.key});
  final HomeBloc bloc = Injector.services.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case SearchPlayerHomeState:
              return SearchPage();
            case ShowPlayerProfileHomeState:
              return PlayerProfilePage();
            default:
              return const FailurePage();
          }
        },
      ),
    );
  }
}
