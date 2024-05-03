import 'package:flutter/material.dart';
import 'package:tigers_journey_evolution/services/services.dart';

class PropertiesProvider extends ChangeNotifier {
  final PreferencesService _preferencesService;

  PropertiesProvider({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  bool _soundOn = true;

  bool _muted = false;

  bool get soundOn => _soundOn;

  bool get muted => _muted;

  void init() {
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
}
