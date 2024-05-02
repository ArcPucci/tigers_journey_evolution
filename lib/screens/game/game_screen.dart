import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key, required this.overlay});

  final EdgeInsets overlay;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          bg: value.bg,
          blurredColor: AppTheme.dark.withOpacity(0.4),
          hasCloseButton: !value.hasAppBar,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: value.hasAppBar,
                child: CustomAppBar(overlay: overlay),
              ),
              const Spacer(),
              Visibility(
                visible: value.currentPage.answers.isEmpty,
                child: MessageBox(
                  text: value.currentPage.content,
                  hasInfoIcon: false,
                  verticalPadding: 30.h,
                  onNext: value.onNext,
                  textStyle: AppTextStyles.textStyle3.copyWith(
                    color: AppTheme.dark4,
                    shadows: [],
                  ),
                ),
              ),
              Visibility(
                visible: value.currentPage.answers.isNotEmpty,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: AppTheme.gradient3,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(3, 4),
                        blurRadius: 3.r,
                        spreadRadius: 1.r,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ],
                    backgroundBlendMode: BlendMode.screen,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        width: 361.w,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          border: GradientBoxBorder(
                            gradient: AppTheme.gradient2,
                            width: 0.1.sp,
                          ),
                          gradient: AppTheme.gradient3,
                        ),
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          top: 26.h,
                          bottom: 13.h,
                        ),
                        child: SafeArea(
                          child: Column(
                            children: [
                              Text(
                                value.content,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.textStyle3.copyWith(
                                  shadows: [],
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Column(
                                children: List.generate(
                                  value.currentPage.answers.length,
                                  (index) {
                                    final answer =
                                        value.currentPage.answers[index];
                                    final selected = value.selected == index;
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        top: index != 0 ? 28.h : 0,
                                      ),
                                      child: QuizButton(
                                        answer: answer,
                                        selected: selected,
                                        onTap: () => value.onAnswer(index),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}