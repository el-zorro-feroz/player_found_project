import 'package:flutter/material.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/presentation/src/bloc/home_bloc.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final HomeBloc bloc = Injector.services.get<HomeBloc>();
  final TextEditingController steamId64TextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // if ((bloc.state as SearchPlayerHomeState).showSnackBar) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text('Player not found'),
    //       ),
    //     );
    //     (bloc.state as SearchPlayerHomeState).showSnackBar = false;
    //   });

    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search steam profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: steamId64TextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                labelText: 'SteamID64',
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FilledButton(
              onPressed: () {
                bloc.add(
                  SearchPlayerHomeEvent(id: steamId64TextEditingController.text),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Player not found'),
                  ),
                );
                (bloc.state as SearchPlayerHomeState).showSnackBar = false;
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
