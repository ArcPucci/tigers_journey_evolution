import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/buttons/custom_button_1.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 361.w,
        height: 212.h,
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
              height: 89.h,
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
                vertical: 16.h,
              ),
              child: Text(
                'Are you sure you want to quit the game?',
                style: AppTextStyles.textStyle2.copyWith(
                  color: AppTheme.dark4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 329.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton1(
                        text: 'YES',
                        width: 158.w,
                        height: 76.h,
                        innerWidth: 146.w,
                        bg: 'assets/png/buttons/small_button_2.png',
                        textStyle: AppTextStyles.title1_2,
                        opacity: 0.4,
                      ),
                      CustomButton1(
                        text: 'NO',
                        width: 158.w,
                        height: 76.h,
                        innerWidth: 146.w,
                        bg: 'assets/png/buttons/small_button_1.png',
                        textStyle: AppTextStyles.title1_2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
