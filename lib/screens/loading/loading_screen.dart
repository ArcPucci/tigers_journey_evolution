import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/bg/bg_widget.dart';
import 'package:tigers_journey_evolution/widgets/loading_indicator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? _timer;
  double _loading = 0;

  @override
  void initState() {
    super.initState();
    _onLoading();
  }

  void _onLoading() {
    _loading = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      final rand = Random().nextDouble() * 0.2;

      if (rand + _loading >= 1) {
        _loading = 1;
        setState(() {});
        _timer?.cancel();
        context.go('/');
        return;
      }

      _loading += rand;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      bg: 'assets/png/bg/bg.png',
      blurredColor: AppTheme.dark.withOpacity(0.3),
      child: Column(
        children: [
          SizedBox(height: 170.h),
          Image.asset(
            'assets/png/logo.png',
            fit: BoxFit.contain,
          ),
          const Spacer(),
          LoadingIndicator(percent: _loading),
          SizedBox(height: 164.h),
        ],
      ),
    );
  }
}
