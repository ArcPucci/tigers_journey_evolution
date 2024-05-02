import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class GameProvider extends ChangeNotifier {
  GameProvider({
    required GoRouter router,
  }) : _router = router;
  final GoRouter _router;

  double _loading = 0;

  double get loading => _loading;

  bool get loaded => _loading == 1;

  Timer? _timer;

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

  String get bg => answered ? _answer.image : currentPage.image;

  String get content => answered ? _answer.description : currentPage.content;

  void init(Level level) {
    _level = level;
    _index = 0;
    _onLoading();
    notifyListeners();
  }

  void onStart() {
    _router.go("$currentPath/game");
  }

  void _onLoading() {
    _loading = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (currentPath != "/onboarding/map/game_loading") {
        _timer?.cancel();
        return;
      }
      print('loading');
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

  void onAnswer(int index) {
    _selected = index;
    _answer = currentPage.answers[index];
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
