import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tigers_journey_evolution/services/services.dart';

class HealthProvider extends ChangeNotifier {
  final PreferencesService _preferencesService;

  HealthProvider({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  int _reminder = 0;

  int _health = 0;

  int get health => _health;

  int get minutes => _reminder ~/ 60;

  int get seconds => _reminder % 60;

  bool _premium = false;

  bool get premium => _premium;

  String get time => _premium
      ? "∞"
      : "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";

  Timer? _timer;

  static const _duration = 60 * _minutes;
  static const _minutes = 30;

  void init() async {
    _premium = _preferencesService.getPremium();
    _health = _preferencesService.getHealth();
    _updateHealth();
    notifyListeners();
  }

  void _updateHealth() async {
    if (_health == 3) return;

    final temp = _preferencesService.getReminder();
    if (temp == null) return;

    _reminder = temp.difference(DateTime.now()).inSeconds;

    if (_reminder <= 0) {
      _health++;

      if (_health >= 3) {
        _health = 3;
        await _preferencesService.setReminder(null);
      } else {
        DateTime newTime = temp.add(const Duration(minutes: _minutes));
        int diff = newTime.difference(DateTime.now()).inSeconds;

        while (_health < 3 && diff <= 0) {
          newTime = newTime.add(const Duration(minutes: _minutes));
          diff = newTime.difference(DateTime.now()).inSeconds;
        }

        await _preferencesService.setReminder(newTime);
      }

      await _preferencesService.setHealth(_health);
    }

    if (_health == 3) return;
    _onSetTimer();
  }

  void useHealth() async {
    if (_health == 3) {
      final date = DateTime.now().add(const Duration(minutes: _minutes));
      await _preferencesService.setReminder(date);
    }

    _health--;
    await _preferencesService.setHealth(_health);
    notifyListeners();

    _updateHealth();
  }

  void _onSetTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_reminder <= 0) {
        _health++;
        if (_health < 3) {
          final temp = _preferencesService.getReminder() ?? DateTime.now();
          final newTemp = temp.add(const Duration(minutes: _minutes));

          _reminder = _duration;
          await _preferencesService.setReminder(newTemp);
        } else {
          await _preferencesService.setReminder(null);
        }

        await _preferencesService.setHealth(_health);

        notifyListeners();

        if (_health < 3) return;
        _timer?.cancel();
        return;
      }

      _reminder--;
      notifyListeners();
    });
  }

  void onBuyPremium() async {
    _premium = true;
    await _preferencesService.setPremium();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
