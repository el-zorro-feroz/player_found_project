import 'dart:async';

import 'package:player_found_project/core/validator/validator.dart';

class SteamIdValidator extends Validator<String> {
  @override
  FutureOr<bool> validate(String t) {
    if (t.length != 17) return false;
    return RegExp(r'\d{17}').hasMatch(t);
  }
}
