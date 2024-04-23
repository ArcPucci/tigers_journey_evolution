import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/bg_widget.dart';
import 'package:tigers_journey_evolution/widgets/buttons/custom_button_1.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BGWidget(
      child: Column(
        children: [
          SizedBox(height: 141.h),
          Image.asset(
            'assets/png/logo.png',
            height: 157.h,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 64.h),
          const CustomButton1(text: 'PLAY'),
          SizedBox(height: 24.h),
          const CustomButton1(
            text: 'PREMIUM',
            bg: 'assets/png/buttons/button2.png',
            opacity: 0.4,
          ),
          SizedBox(height: 24.h),
          const CustomButton1(
            text: 'EXIT',
            bg: 'assets/png/buttons/button2.png',
            opacity: 0.4,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Terms of Use', style: AppTextStyles.title2_1),
              SizedBox(width: 16.w),
              Text('Privacy Policy', style: AppTextStyles.title2_1),
            ],
          ),
        ],
      ),
    );
  }
}
