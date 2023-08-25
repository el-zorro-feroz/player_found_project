import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/presentation/src/bloc/home_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PlayerProfilePage extends StatelessWidget {
  PlayerProfilePage({super.key});

  final HomeBloc bloc = Injector.services.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    final player = (bloc.state as ShowPlayerProfileHomeState).player;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Image.network(player.userAvatarLink),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text('User name: ${player.username}'),
            const SizedBox(
              height: 16.0,
            ),
            Text('User SteamId64: ${player.id}'),
            const SizedBox(
              height: 16.0,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: 'Profile link: '),
                  TextSpan(
                    text: player.userProfileLink,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => launchUrlString(player.userProfileLink, mode: LaunchMode.inAppWebView),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
