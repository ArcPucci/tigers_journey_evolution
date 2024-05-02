import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tigers_journey_evolution/screens/screens.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class PremiumPopover extends StatelessWidget {
  const PremiumPopover({
    super.key,
    this.hasMessage = true,
  });

  final bool hasMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 52.w),
          child: Image.asset(
            'assets/png/icons/down.png',
            width: 17.w,
            height: 12.h,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 6.h),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      width: 360.w,
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
                        left: 12.w,
                        right: 12.w,
                        top: 12.h,
                        bottom: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Text(
                              'Premium',
                              style: AppTextStyles.textStyle3.copyWith(
                                shadows: [],
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          GestureDetector(
                            onTap: () => onTapPremium(context),
                            child: Container(
                              width: 335.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: AppTheme.bgGradient,
                                border: GradientBoxBorder(
                                  gradient: AppTheme.bgGradient,
                                  width: 0.1.sp,
                                ),
                                boxShadow: [AppTheme.boxShadow1],
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 148.w,
                                    height: 44.h,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          width: 124.w,
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            gradient: AppTheme.bgGradient,
                                            border: GradientBoxBorder(
                                              gradient: AppTheme.bgGradient,
                                              width: 0.1.sp,
                                            ),
                                            boxShadow: [AppTheme.boxShadow1],
                                          ),
                                          padding: EdgeInsets.only(
                                            right: 10.w,
                                            top: 3.h,
                                          ),
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'infinite lives',
                                            style:
                                                AppTextStyles.title2_1.copyWith(
                                              shadows: [],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: Center(
                                            child: Container(
                                              width: 47.w,
                                              height: 44.h,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/png/heart.png'),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              alignment: Alignment.topCenter,
                                              padding: EdgeInsets.only(top: 5.h),
                                              child: Text(
                                                '∞',
                                                style: AppTextStyles.textStyle5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomButton2(
                                    text: '\$0,99',
                                    onTap: () => onTapPremium(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          CustomButton2(
                            text: 'Restore Purchase',
                            width: 335.w,
                            height: 60.h,
                            innerWidth: 325.w,
                            innerHeight: 54.h,
                            innerWidth2: 316.w,
                            innerHeight2: 47.h,
                            opacity: 0.4,
                            bg: 'assets/png/buttons/green_button_4.png',
                            onTap: () => onTapPremium(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 6.w,
                top: 0,
                child: Transform.rotate(
                  angle: (50 / 180) * pi,
                  child: GestureDetector(
                    onTap: Navigator.of(context).pop,
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
        const Spacer(),
        Visibility(
          visible: hasMessage,
          child: const MessageBox(
            text: "You can buy lives to complete the game",
            hasNextButton: false,
          ),
        ),
      ],
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
