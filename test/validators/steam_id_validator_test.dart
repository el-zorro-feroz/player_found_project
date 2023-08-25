import 'package:flutter_test/flutter_test.dart';
import 'package:player_found_project/scr/domain/validators/steam_id_validator.dart';

const String correctSteamID = '76561198114844417';
const String incorrectSteamID = 'xxxx';

void main() {
  group('Steam ID Validator', () {
    final SteamIdValidator steamIdValidator = SteamIdValidator();

    test('Correct input test', () async {
      // Act

      // Arrange
      final bool result = await steamIdValidator.validate(correctSteamID);

      // Assert
      expect(result, true);
    });

    test('Incorrect input test', () async {
      // Act

      // Arrange
      final bool result = await steamIdValidator.validate(incorrectSteamID);

      // Assert
      expect(result, false);
    });
  });
}
