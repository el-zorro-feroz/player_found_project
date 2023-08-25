import 'dart:convert';

import 'package:player_found_project/scr/domain/entities/player.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required super.id,
    required super.username,
    required super.userProfileLink,
    required super.userAvatarLink,
  });

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'],
      username: map['username'],
      userProfileLink: map['meta']['profileurl'],
      userAvatarLink: map['avatar'],
    );
  }

  factory PlayerModel.fromJson(String source) {
    return PlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() => 'PlayerModel(id: $id, username: $username, userProfileLink: $userProfileLink, userAvatarLink: $userAvatarLink)';

  PlayerModel copyWith(
    String? id,
    String? username,
    String? userProfileLink,
    String? userAvatarLink,
  ) {
    return PlayerModel(
      id: id ?? this.id,
      username: username ?? this.username,
      userProfileLink: userProfileLink ?? this.userProfileLink,
      userAvatarLink: userAvatarLink ?? this.userAvatarLink,
    );
  }
}
