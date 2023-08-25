import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String id;
  final String username;
  final String userProfileLink;
  final String userAvatarLink;

  const Player({
    required this.id,
    required this.username,
    required this.userProfileLink,
    required this.userAvatarLink,
  });

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify => true;
}
