import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class LifeIndicator extends StatelessWidget {
  const LifeIndicator({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<HealthProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Stack(
          children: [
            Container(
              height: 46.h,
              padding: EdgeInsets.only(right: 15.w),
              alignment: Alignment.centerLeft,
              child: Container(
                height: 28.h,
                decoration: BoxDecoration(
                  boxShadow: [AppTheme.boxShadow1],
                  borderRadius: BorderRadius.circular(40),
                  gradient: AppTheme.bgGradient,
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      height: 28.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: AppTheme.bgGradient,
                        border: GradientBoxBorder(
                          gradient: AppTheme.bgGradient,
                          width: 0.1.sp,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 15.w, right: 38.w),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        value.health == 3 ? 'Full' : value.time,
                        style: AppTextStyles.textStyle4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/png/heart.png',
                    width: 48.w,
                    height: 44.h,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 5.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        '${value.premium ? '∞' : value.health}',
                        style: AppTextStyles.textStyle5,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5.w,
                    bottom: 5.h,
                    child: GestureDetector(
                      onTap: () {
                        if (value.premium) return;
                        onTap?.call();
                      },
                      child: Image.asset(
                        'assets/png/icons/plus.png',
                        width: 12.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
