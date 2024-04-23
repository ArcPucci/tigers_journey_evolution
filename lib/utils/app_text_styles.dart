import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class AppTextStyles {
  static final TextStyle title1_2 = TextStyle(
    fontFamily: 'GoneHills',
    fontSize: 32.r,
    height: 35 / 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
    color: AppTheme.mainLight,
    shadows: [
      BoxShadow(
        offset: const Offset(2, 2),
        blurRadius: 3.r,
        color: AppTheme.darkGreen.withOpacity(0.72),
      ),
    ],
  );

  static final TextStyle title1_3 = TextStyle(
    fontFamily: 'GoneHills',
    fontSize: 18.r,
    height: 35 / 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
    color: AppTheme.mainLight,
    shadows: [
      BoxShadow(
        offset: const Offset(2, 2),
        blurRadius: 3.r,
        color: AppTheme.darkGreen.withOpacity(0.72),
      ),
    ],
  );

  static final TextStyle title2_1 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 24.r,
    height: 26 / 24,
    fontWeight: FontWeight.w400,
    color: AppTheme.mainLight,
    shadows: [
      BoxShadow(
        offset: const Offset(2, 2),
        blurRadius: 3.r,
        color: AppTheme.darkGreen.withOpacity(0.72),
      ),
    ],
  );
}
