import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class CheckPointStar extends StatelessWidget {
  const CheckPointStar({
    super.key,
    required this.index,
    this.selected = false,
    this.passed = false,
    this.onTap,
  });

  final int index;
  final bool passed;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = !passed && selected ? 63.w : 49.w;
    final height = !passed && selected ? 62.h : 48.h;
    final enabled = passed || selected;
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/png/star.png',
                width: width + 3.w,
                height: height + 4.h,
                fit: BoxFit.contain,
              ),
              Visibility(
                visible: !enabled,
                child: Image.asset(
                  'assets/png/star_shadow.png',
                  width: width,
                  height: height,
                  fit: BoxFit.contain,
                ),
              ),
              Visibility(
                visible: enabled,
                child: Text(
                  '$index',
                  style: TextStyle(
                    fontFamily: 'HanaleiFill',
                    fontWeight: FontWeight.w400,
                    foreground: Paint()
                      ..color = AppTheme.lightYellow
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3.sp,
                    fontSize: 22.r,
                    height: 24 / 22,
                    letterSpacing: -0.86,
                  ),
                ),
              ),
              Opacity(
                opacity: enabled ? 1 : 0.8,
                child: Text(
                  '$index',
                  style: TextStyle(
                    fontFamily: 'HanaleiFill',
                    fontWeight: FontWeight.w400,
                    fontSize: 22.r,
                    height: 24 / 22,
                    letterSpacing: -0.86,
                    color: AppTheme.dark4,
                  ),
                ),
              ),
              Visibility(
                visible: passed,
                child: Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/png/icons/tick.png',
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: selected,
          child: Transform.rotate(
            angle: pi,
            child: Image.asset(
              'assets/png/icons/down.png',
              width: 32.w,
              height: 22.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
