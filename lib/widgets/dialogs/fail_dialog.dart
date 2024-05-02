import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class FailDialog extends StatelessWidget {
  const FailDialog({super.key});

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
                  padding: EdgeInsets.only(
                    left: 27.w,
                    right: 27.w,
                    top: 26.h,
                    bottom: 16.h,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'You have run out of lives, wait until your lives are restored or buy premium to continue the game',
                    style: AppTextStyles.textStyle2.copyWith(
                      color: AppTheme.dark4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 247.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton2(
                            width: 100.r,
                            height: 100.r,
                            icon: 'assets/png/icons/home.png',
                            borderGradient: AppTheme.whiteBorderGradient,
                            boxShadow: AppTheme.boxShadow6,
                            bgColor: AppTheme.lightYellow,
                            size: 66.r,
                            padding: EdgeInsets.only(top: 3.r),
                          ),
                          CustomIconButton2(
                            width: 100.r,
                            height: 100.r,
                            icon: 'assets/png/icons/menu.png',
                            borderGradient: AppTheme.gradient2,
                            bgGradient: AppTheme.gradient2,
                            boxShadow: AppTheme.boxShadow6,
                            size: 66.r,
                            padding: EdgeInsets.only(left: 8.r),
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
