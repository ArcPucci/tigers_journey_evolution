import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class FactsPopover extends StatelessWidget {
  const FactsPopover({
    super.key,
    this.hasMessage = true,
  });

  final bool hasMessage;

  @override
  Widget build(BuildContext context) {
    return Consumer<FactsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.h + 72.r + (36.r - 17.w) / 2 + 24.w,
                ),
                child: Image.asset(
                  'assets/png/icons/down.png',
                  width: 17.w,
                  height: 12.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        width: 361.w,
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
                          children: List.generate(
                            facts.length,
                                (index) {
                              final fact = facts[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: index != 0 ? 8.h : 0,
                                ),
                                child: Container(
                                  width: 335.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: AppTheme.gradient2,
                                    border: GradientBoxBorder(
                                      gradient: AppTheme.gradient2,
                                      width: 0.1.sp,
                                    ),
                                    boxShadow: [AppTheme.boxShadow1],
                                  ),
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 12.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        fact.name,
                                        style: AppTextStyles.textStyle2.copyWith(
                                          color: Colors.white,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      CustomButton2(
                                        text: 'Go!',
                                        onTap: () => value.onStart(fact),
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
            const Spacer(),
            Visibility(
              visible: hasMessage,
              child: const MessageBox(
                hasNextButton: false,
                text:
                "Click on the “Go” button next to any fact that interests you to go to view",
              ),
            ),
          ],
        );
      },
    );
  }
}
