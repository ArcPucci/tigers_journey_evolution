import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  static const premiumKey = "PREMIUM";
  static const welcomeKey = "WELCOME";

  Future<void> setWelcome() async {
    await _preferences.setBool(welcomeKey, true);
  }

  bool getWelcome() {
    return _preferences.getBool(welcomeKey) ?? false;
  }

  Future<void> setPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() {
    return _preferences.getBool(premiumKey) ?? false;
  }
}
