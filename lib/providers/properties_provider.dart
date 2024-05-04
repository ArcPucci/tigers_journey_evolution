import 'package:flutter/material.dart';
import 'package:tigers_journey_evolution/services/services.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class PropertiesProvider extends ChangeNotifier {
  final PreferencesService _preferencesService;

  PropertiesProvider({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  bool _soundOn = true;

  bool _muted = false;

  bool get soundOn => _soundOn;

  bool get muted => _muted;

  List<String> _mails = [];

  List<String> get receivedMails => _mails;

  bool _hasNotification = false;

  bool get hasNotification => _hasNotification;

  void init() async {
    _mails = _preferencesService.getMails();

    final lastDate = _preferencesService.getLastDate();
    int index = _preferencesService.getIndex();

    if (lastDate.day < DateTime.now().day && index != mails.length - 1) {
      index++;
      _hasNotification = true;
      _mails.add(mails[index]);
      await _preferencesService.setLastDate();
    }

    _soundOn = _preferencesService.getSound();
    _muted = _preferencesService.getMuted();
    notifyListeners();
  }

  void onChangeSound() async {
    _soundOn = !_soundOn;
    await _preferencesService.updateSound(_soundOn);
    notifyListeners();
  }

  void onMute() async {
    _muted = !_muted;
    await _preferencesService.updateMuted(_muted);
    notifyListeners();
  }

  void openMails() {
    _hasNotification = false;
    notifyListeners();
  }

  void onDelete(int index) async {
    _mails.removeAt(index);

    await _preferencesService.setMails(_mails);
    notifyListeners();
  }
}
