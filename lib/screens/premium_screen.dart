import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/buttons/custom_button_1.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.greenGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 6.h),
              Container(
                width: 357.r,
                height: 353.r,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/png/logo2.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(51),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8.7.r,
                      color: AppTheme.darkGreen2,
                      offset: const Offset(8.7, 8.7),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 14.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: Image.asset(
                          'assets/png/icons/close.png',
                          width: 28.r,
                          height: 28.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/png/logo3.png',
                      height: 157.h,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(height: 28.r),
                  ],
                ),
              ),
              SizedBox(height: 42.h),
              Text(
                'Explore the world\nof tigers without limits!',
                style: AppTextStyles.textStyle1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 19.h),
              Opacity(
                opacity: 0.9,
                child: Text(
                  'Get unlimited life and continue\nyour journey',
                  style: AppTextStyles.textStyle2,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              CustomButton1(
                text: 'Get for \$0.99',
                height: 63.h,
                innerHeight: 59.h,
                textStyle: AppTextStyles.textStyle3,
                onTap: () => onBuyPremium(context),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms of Use',
                    style: AppTextStyles.title2_1,
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () => onBuyPremium(context),
                    child: Text(
                      'Restore',
                      style: AppTextStyles.title2_1,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Privacy Policy',
                    style: AppTextStyles.title2_1,
                  ),
                ],
              ),
              SizedBox(height: 57.h),
            ],
          ),
        ),
      ),
    );
  }

  void onBuyPremium(BuildContext context) {
    final provider = Provider.of<HealthProvider>(
      context,
      listen: false,
    );

    provider.onBuyPremium();
    context.pop();
  }
}
