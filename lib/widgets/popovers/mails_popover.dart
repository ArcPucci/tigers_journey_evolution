import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/intro_provider.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/bg/message_box.dart';

class MailsPopover extends StatelessWidget {
  const MailsPopover({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.w + (36.r - 17.w) / 2),
                    child: Image.asset(
                      'assets/png/icons/down.png',
                      width: 17.w,
                      height: 12.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        15,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: SizedBox(
                              width: 361.w,
                              height: 89.h,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: 361.w,
                                    height: 84.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: AppTheme.bgGradient,
                                      border: GradientBoxBorder(
                                        gradient: AppTheme.bgGradient,
                                        width: 0.1.sp,
                                      ),
                                      boxShadow: [AppTheme.boxShadow1],
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 15.w, right: 37.w),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Use your stinging claws and powerful jaws to conquer any jungle challenge.',
                                      style: AppTextStyles.textStyle7,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 5.w,
                                    child: Transform.rotate(
                                      angle: (50 / 180) * pi,
                                      child: GestureDetector(
                                        child: Image.asset(
                                          'assets/png/icons/plus.png',
                                          width: 24.r,
                                          height: 24.r,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: MessageBox(
                text: value.index < 5
                    ? value.text
                    : "You can see all notifications here",
                hasNextButton: value.hasNextButton,
                hasInfoIcon: value.hasInfoIcon,
                onNext: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  value.onNext();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
