import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/providers/game_provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/services/services.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class IntroProvider extends ChangeNotifier {
  IntroProvider({
    required GoRouter router,
    required GameProvider gameProvider,
    required PreferencesService preferencesService,
  })  : _router = router,
        _gameProvider = gameProvider,
        _preferencesService = preferencesService;

  final GoRouter _router;
  final GameProvider _gameProvider;
  final PreferencesService _preferencesService;

  int _index = 0;

  int _subIndex = 0;

  String get text =>
      (!_awardShowed && hasAward) ? awardTexts[_subIndex] : introTexts[_index];

  bool get hasNextButton => _index < introTexts.length - 2;

  bool get hasInfoIcon => _hasAward || _index < introTexts.length - 1;

  bool get hasMailsButton => _index == 3 || _loadingGame;

  bool get hasSettingsButton => _index == 4 || _loadingGame;

  bool get lifeIndicator => _index <= 2 || _loadingGame;

  bool get hasAward => _hasAward;

  bool get awardVisible => _hasAward && !_awardShowed;

  bool _awardShowed = false;

  bool get awardReached => _preferencesService.getLevel() >= levels.last.id;

  bool _hasAward = false;

  int get index => _index;

  bool _loadingGame = false;

  bool get loadingGame => _loadingGame;

  String get currentPath =>
      _router.routerDelegate.currentConfiguration.fullPath;

  Level _level = levels[0];

  String get map => _level.map;

  void onSkipAward() async {
    if (hasAward && _subIndex < 1) {
      _subIndex++;

      notifyListeners();
      return;
    }

    _hasAward = !hasAward;
    _awardShowed = true;
    await _preferencesService.setAwardShow();
    await _preferencesService.setAward();
    notifyListeners();
  }

  void onNext() async {
    if (_preferencesService.getWelcome()) return;

    _index++;
    notifyListeners();

    if (_index != 5) return;

    await _preferencesService.setWelcome();
  }

  void onPlay() {
    if (_preferencesService.getFirstInit()) {
      _router.go('/onboarding');
    } else {
      _reset();
      _hasAward = _preferencesService.getAward();
      _awardShowed = _preferencesService.getAwardShow();
      _router.go('/map');
    }
  }

  void showAward() {
    _hasAward = true;
    notifyListeners();
  }

  void onSkip() async {
    await _preferencesService.setFirstInit();
    _reset();
    _hasAward = _preferencesService.getAward();
    _awardShowed = _preferencesService.getAwardShow();
    _router.go('/map');
  }

  void _reset() {
    if (!_preferencesService.getWelcome())
      _index = 0;
    else
      _index = 5;

    notifyListeners();
  }

  void onEnter(Level level) async {
    _level = level;
    _loadingGame = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));

    _loadingGame = false;
    notifyListeners();

    _router.go('$currentPath/game_loading');
    _gameProvider.onSelectLevel(_level);
  }
}
