import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  static const premiumKey = "PREMIUM";
  static const welcomeKey = "WELCOME";
  static const levelKey = "LEVEL";
  static const healthKey = "HEALTH";
  static const reminderKey = "REMINDER";
  static const mutedKey = "MUTED";
  static const soundKey = "SOUND";
  static const awardKey = "AWARD";
  static const awardShowed = "AWARD_SHOW";
  static const firstInitKey = "FIRST_INIT";
  static const mailsKey = "MAILS";
  static const mailIndexKey = "MAIL_INDEX";
  static const lastDateKey = "LAST_DATE";

  Future<void> setFirstInit() async {
    await _preferences.setBool(firstInitKey, false);
  }

  bool getFirstInit() {
    return _preferences.getBool(firstInitKey) ?? true;
  }

  Future<void> setAwardShow() async {
    await _preferences.setBool(awardShowed, true);
  }

  bool getAwardShow() {
    return _preferences.getBool(awardShowed) ?? false;
  }

  Future<void> setAward() async {
    await _preferences.setBool(awardKey, true);
  }

  bool getAward() {
    return _preferences.getBool(awardKey) ?? false;
  }

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

  Future<void> setLevel(int index) async {
    await _preferences.setInt(levelKey, index);
  }

  int getLevel() {
    return _preferences.getInt(levelKey) ?? 0;
  }

  Future<void> setHealth(int health) async {
    await _preferences.setInt(healthKey, health);
  }

  int getHealth() {
    return _preferences.getInt(healthKey) ?? 3;
  }

  Future<void> setReminder(DateTime? dateTime) async {
    final date = dateTime?.microsecondsSinceEpoch;
    await _preferences.setInt(reminderKey, date ?? 0);
  }

  DateTime? getReminder() {
    final map = _preferences.getInt(reminderKey) ?? 0;
    if (map == 0) return null;

    final date = DateTime.fromMicrosecondsSinceEpoch(map);
    return date;
  }

  Future<void> updateSound(bool soundOn) async {
    await _preferences.setBool(soundKey, soundOn);
  }

  bool getSound() {
    return _preferences.getBool(soundKey) ?? true;
  }

  Future<void> updateMuted(bool muted) async {
    await _preferences.setBool(soundKey, muted);
  }

  bool getMuted() {
    return _preferences.getBool(soundKey) ?? false;
  }

  Future<void> setMails(List<String> mails) async {
    await _preferences.setStringList(mailsKey, mails);
  }

  List<String> getMails() {
    return _preferences.getStringList(mailsKey) ??
        ["Hello, welcome to Tiger's Journey: Evolution. Have a good time!"];
  }

  Future<void> setMailIndex(int index) async {
    await _preferences.setInt(mailIndexKey, index);
  }

  int getIndex() {
    return _preferences.getInt(mailIndexKey) ?? 1;
  }

  Future<void> setLastDate() async {
    final temp = DateTime.now().microsecondsSinceEpoch;
    await _preferences.setInt(lastDateKey, temp);
  }

  DateTime getLastDate() {
    final temp = _preferences.getInt(lastDateKey) ?? 0;

    if (temp == 0) return DateTime.now();

    final date = DateTime.fromMicrosecondsSinceEpoch(temp);
    return date;
  }
}
