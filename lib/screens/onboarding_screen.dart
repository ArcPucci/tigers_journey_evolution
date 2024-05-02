import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/intro_provider.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/bg/bg2.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Consumer<IntroProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Column(
                    children: [
                      SizedBox(height: 45.h),
                      Container(
                        width: 339.w,
                        height: 700.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/png/letter.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 26.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 158.h),
                            Text(
                              "Welcome to \"Tiger's Journey: Evolution\" where you guide the evolution of tigers through key periods of history. Your goal is to navigate through five critical scenes, making choices that will ensure the survival and prosperity of your tiger lineage. You start with 3 lives - each incorrect choice will cost you a life. Choose wisely to complete the game successfully.",
                              style: AppTextStyles.textStyle2.copyWith(
                                color: AppTheme.dark4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 34.h),
                            GestureDetector(
                              onTap: value.onSkip,
                              child: Image.asset(
                                'assets/png/icons/next.png',
                                width: 40.w,
                                height: 35.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
