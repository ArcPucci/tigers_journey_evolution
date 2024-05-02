import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class LifeIndicator extends StatelessWidget {
  const LifeIndicator({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 87.w,
      height: 46.h,
      child: Stack(
        children: [
          Positioned(
            top: 11.h,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [AppTheme.boxShadow1],
                borderRadius: BorderRadius.circular(40),
                gradient: AppTheme.bgGradient,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    width: 74.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: AppTheme.bgGradient,
                      border: GradientBoxBorder(
                        gradient: AppTheme.bgGradient,
                        width: 0.1.sp,
                      ),
                    ),
                    padding: EdgeInsets.only(left: 15.w),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Full',
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
                      '3',
                      style: AppTextStyles.textStyle5,
                    ),
                  ),
                ),
                Positioned(
                  right: 5.w,
                  bottom: 5.h,
                  child: GestureDetector(
                    onTap: onTap,
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
      ),
    );
  }
}
