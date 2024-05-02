import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/providers/game_provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class IntroProvider extends ChangeNotifier {
  IntroProvider({
    // required PreferencesService preferencesService,
    required GoRouter router,
    required GameProvider gameProvider,
  })  : _router = router,
        _gameProvider = gameProvider;

  final GoRouter _router;
  final GameProvider _gameProvider;

  // final PreferencesService _preferencesService;

  int _index = 0;

  String get text => introTexts[_index];

  bool get hasNextButton => _index < introTexts.length - 2;

  bool get hasInfoIcon => _index < introTexts.length - 1;

  bool get hasMailsButton => _index == 3 || _loadingGame;

  bool get hasSettingsButton => _index == 4 || _loadingGame;

  bool get lifeIndicator => _index <= 2 || _loadingGame;

  int get index => _index;

  bool _loadingGame = false;

  bool get loadingGame => _loadingGame;

  String get currentPath =>
      _router.routerDelegate.currentConfiguration.fullPath;

  Level _level = levels[0];

  String get map => _level.map;

  void onNext() {
    _index++;
    notifyListeners();
  }

  void onPlay() {
    _router.go('/onboarding');
  }

  void onSkip() {
    _reset();
    _router.go('$currentPath/map');
  }

  void _reset() {
    _index = 0;
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
    _gameProvider.init(_level);
  }
}
