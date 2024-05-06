import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class FactsProvider extends ChangeNotifier {
  FactsProvider({required GoRouter router}) : _router = router;

  final GoRouter _router;

  Level _level = facts.first;

  Level get level => _level;

  double _loading = 0;

  double get loading => _loading;

  Timer? _timer;

  String get currentPath =>
      _router.routerDelegate.currentConfiguration.fullPath;

  int _index = 0;

  CustomPage get currentPage => _level.pages[_index];

  void onStart(Level level) {
    _level = level;
    _index = 0;
    notifyListeners();
    _router.go("$currentPath/fact_loading");
    _onLoading();
  }

  void onNext() {
    if(_index == _level.pages.length - 1) {
      _router.pop();
      return;
    }

    _index++;
    notifyListeners();
  }

  void _onLoading() {
    _loading = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (currentPath != "/map/fact_loading") {
        _timer?.cancel();
        return;
      }

      final rand = Random().nextDouble() * 0.2;

      if (rand + _loading >= 1) {
        _loading = 1;
        notifyListeners();

        _router.go('/map/fact');
        _timer?.cancel();
        return;
      }

      _loading += rand;
      notifyListeners();
    });
  }
}
