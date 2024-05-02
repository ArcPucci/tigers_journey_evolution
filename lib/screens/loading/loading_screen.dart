import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/bg/bg_widget.dart';
import 'package:tigers_journey_evolution/widgets/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

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
          const LoadingIndicator(percent: 0.8),
          SizedBox(height: 164.h),
        ],
      ),
    );
  }
}
