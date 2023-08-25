import 'dart:convert';

import 'package:player_found_project/scr/data/models/player_model.dart';

import 'package:http/http.dart' as http;

class SteamDatasource {
  Future<PlayerModel> getModelByID64(String id) async {
    var url = Uri.https(
      'playerdb.co',
      '/api/player/steam/$id',
    );
    final http.Response response = await http.get(url);
    final result = jsonDecode(response.body)['data']['player'];
    var model = PlayerModel.fromMap(result);
    return model;
  }
}
