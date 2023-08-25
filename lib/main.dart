import 'package:flutter/material.dart';
import 'package:player_found_project/core/services/services.dart';
import 'package:player_found_project/scr/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector().initService();
  // final uc = Injector.services.get<GetConcretePlayerUseCase>();
  // final player = await uc.call('76561198114844417');
  // print(player.toString());
  runApp(App());
}
