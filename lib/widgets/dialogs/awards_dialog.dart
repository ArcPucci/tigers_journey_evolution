import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class AwardsDialog extends StatelessWidget {
  const AwardsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(height: 75.h),
            SizedBox(
              width: 405.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 339.w,
                    height: 550.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/png/letter2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: Column(
                      children: [
                        SizedBox(height: 169.h),
                        Text(
                          """Congratulations!\nYou have completed the game\nTiger's Journey: Evolution!\nYour tigers have passed many\ntests to live happily, reproduce\nand develop their offspring!\nYou were able to save the\ntiger population!""",
                          style: AppTextStyles.textStyle2.copyWith(
                            color: AppTheme.dark4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Image.asset(
                              'assets/png/icons/next.png',
                              width: 40.w,
                              height: 35.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    child: Image.asset(
                      'assets/png/stars.png',
                      width: 400.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            MessageBox(
              hasNextButton: false,
              text: 'Click to continue to find out some interesting facts',
            ),
          ],
        ),
      ),
    );
  }
}
