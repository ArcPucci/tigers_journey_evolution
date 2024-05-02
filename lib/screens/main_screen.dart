import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/intro_provider.dart';
import 'package:tigers_journey_evolution/screens/screens.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          bg: 'assets/png/bg/bg.png',
          blurredColor: AppTheme.dark.withOpacity(0.3),
          child: Column(
            children: [
              SizedBox(height: 141.h),
              Image.asset(
                'assets/png/logo.png',
                height: 157.h,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(height: 64.h),
              CustomButton1(
                text: 'PLAY',
                onTap: value.onPlay,
              ),
              SizedBox(height: 24.h),
              CustomButton1(
                text: 'PREMIUM',
                bg: 'assets/png/buttons/button2.png',
                opacity: 0.4,
                onTap: () => onTapPremium(context),
              ),
              SizedBox(height: 24.h),
              CustomButton1(
                text: 'EXIT',
                bg: 'assets/png/buttons/button2.png',
                opacity: 0.4,
                onTap: () => onExit(context),
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
      },
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }

  void onExit(BuildContext context) async {
    await showDialog(
      context: context,
      barrierColor: AppTheme.dark.withOpacity(0.9),
      builder: (context) {
        return const Center(child: ExitDialog());
      },
    );
  }
}
