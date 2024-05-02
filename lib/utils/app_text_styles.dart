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
    shadows: [AppTheme.boxShadow4],
  );

  static final TextStyle title1_3 = TextStyle(
    fontFamily: 'GoneHills',
    fontSize: 18.r,
    height: 35 / 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
    color: AppTheme.mainLight,
    shadows: [AppTheme.boxShadow4],
  );

  static final TextStyle title2_1 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 24.r,
    height: 26 / 24,
    fontWeight: FontWeight.w400,
    color: AppTheme.mainLight,
    shadows: [AppTheme.boxShadow4],
  );

  static final TextStyle textStyle1 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 50.r,
    fontWeight: FontWeight.w700,
    height: 44 / 50,
    color: AppTheme.lightYellow,
  );

  static final TextStyle textStyle2 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 28.r,
    fontWeight: FontWeight.w400,
    height: 30 / 28,
    color: AppTheme.lightYellow,
  );

  static final TextStyle textStyle3 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 28.r,
    fontWeight: FontWeight.w700,
    height: 30 / 28,
    color: AppTheme.lightYellow,
    shadows: [AppTheme.boxShadow4],
  );

  static final TextStyle textStyle4 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 22.r,
    fontWeight: FontWeight.w400,
    height: 24 / 22,
    color: AppTheme.lightYellow,
  );

  static final TextStyle textStyle5 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 40.r,
    fontWeight: FontWeight.w400,
    height: 1,
    color: AppTheme.lightYellow,
    shadows: [
      BoxShadow(
        offset: const Offset(2, 2),
        blurRadius: 5.r,
        color: Colors.black.withOpacity(0.25),
      ),
    ],
  );

  static final TextStyle textStyle6 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 32.r,
    fontWeight: FontWeight.w400,
    height: 35 / 32,
    color: AppTheme.lightYellow,
    shadows: [AppTheme.boxShadow4],
  );

  static final TextStyle textStyle7 = TextStyle(
    fontFamily: 'Dongle',
    fontSize: 22.r,
    fontWeight: FontWeight.w400,
    height: 1,
    color: AppTheme.lightYellow,
  );

  static final TextStyle textStyle8 = TextStyle(
    fontFamily: 'Flavors',
    fontSize: 24.r,
    fontWeight: FontWeight.w400,
    height: 52 / 24,
    letterSpacing: 1,
    color: AppTheme.lightYellow,
  );
}
