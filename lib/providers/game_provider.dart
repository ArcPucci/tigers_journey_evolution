import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/providers/health_provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/services/services.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class GameProvider extends ChangeNotifier {
  GameProvider({
    required GoRouter router,
    required PreferencesService preferencesService,
    required HealthProvider healthProvider,
  })  : _router = router,
        _preferencesService = preferencesService,
        _healthProvider = healthProvider;

  final GoRouter _router;
  final PreferencesService _preferencesService;
  final HealthProvider _healthProvider;

  int _reachedLevel = 0;

  int get reachedLevel => _reachedLevel;

  double _loading = 0;

  double get loading => _loading;

  bool get loaded => _loading == 1;

  Timer? _timer;

  bool get premium => _healthProvider.premium;

  String get currentPath =>
      _router.routerDelegate.currentConfiguration.fullPath;

  Level _level = levels[0];

  Level get level => _level;

  CustomPage get currentPage => _level.pages[_index];

  bool get hasAppBar => currentPage.answers.isNotEmpty;

  int _index = 0;

  int _selected = -1;

  int get selected => _selected;

  bool get answered => _selected != -1;

  Answer _answer = Answer.empty();

  Answer get answer => _answer;

  String get bg => answered ? _answer.image : currentPage.image;

  String get content => answered ? _answer.description : currentPage.content;

  int get health => _healthProvider.health;

  void onInit() {
    _reachedLevel = _preferencesService.getLevel();
  }

  void onSelectLevel(Level level) {
    _level = level;
    _onReset();
    _onLoading();
    notifyListeners();
  }

  void onStart() {
    _router.go("/map/game");
  }

  void _onLoading() {
    _loading = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (currentPath != "/map/game_loading") {
        _timer?.cancel();
        return;
      }

      final rand = Random().nextDouble() * 0.2;

      if (rand + _loading >= 1) {
        _loading = 1;
        notifyListeners();
        _timer?.cancel();
        return;
      }

      _loading += rand;
      notifyListeners();
    });
  }

  void onNext() {
    if (_index == _level.pages.length - 1) {
      return;
    }
    _index++;
    notifyListeners();
  }

  Future<void> onAnswer(int index) async {
    _selected = index;
    _answer = currentPage.answers[index];
    notifyListeners();

    if (_answer.correct == Correctness.correct && _reachedLevel == _level.id) {
      _reachedLevel = _level.id + 1;
      await _preferencesService.setLevel(_level.id + 1);

      await Future.delayed(const Duration(seconds: 5));
      return;
    } else if (_answer.correct == Correctness.wrong) {
      _healthProvider.useHealth();
    }

    notifyListeners();
    await Future.delayed(const Duration(seconds: 5));
  }

  void onRestart() {
    _router.go('/map/game_loading');
    onSelectLevel(_level);
    notifyListeners();
  }

  void onNextLevel() {
    if (_level.id == levels.last.id) {
      _router.replace('/map');
      return;
    }

    _router.go('/map/game_loading');
    final newLevel = levels.firstWhere((e) => e.id == _level.id + 1);
    _level = newLevel;
    onSelectLevel(newLevel);
  }

  void onMenu() {
    _router.replace('/map');
    _onReset();
  }

  void _onReset() {
    _answer = Answer.empty();
    _index = 0;
    _selected = -1;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
