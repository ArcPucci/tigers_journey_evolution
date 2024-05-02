import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            width: 361.w,
            height: 286.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2.sp,
                color: AppTheme.dark4,
              ),
              gradient: AppTheme.gradient2,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 3),
                  blurRadius: 3.r,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                  width: 361.w,
                  height: 146.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: AppTheme.lightYellow,
                    border: Border(
                      bottom: BorderSide(
                        width: 2.sp,
                        color: AppTheme.dark4,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 27.w,
                    vertical: 35.h,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Great job! Your tigers have passed this era and can evolve further',
                    style: AppTextStyles.textStyle2.copyWith(
                      color: AppTheme.dark4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 297.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton2(
                            width: 76.r,
                            height: 76.r,
                            icon: 'assets/png/icons/restart_white.png',
                            bgGradient: AppTheme.gradient2,
                            borderGradient: AppTheme.gradient2,
                            boxShadow: AppTheme.boxShadow7,
                            size: 50.r,
                            iconColor: Colors.white,
                          ),
                          CustomIconButton2(
                            width: 100.r,
                            height: 100.r,
                            icon: 'assets/png/icons/play.png',
                            borderGradient: AppTheme.whiteBorderGradient,
                            boxShadow: AppTheme.boxShadow6,
                            bgColor: AppTheme.lightYellow,
                            size: 66.r,
                            padding: EdgeInsets.only(left: 8.r),
                          ),
                          CustomIconButton2(
                            width: 76.r,
                            height: 76.r,
                            icon: 'assets/png/icons/menu.png',
                            bgGradient: AppTheme.gradient2,
                            borderGradient: AppTheme.gradient2,
                            boxShadow: AppTheme.boxShadow7,
                            size: 50.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
