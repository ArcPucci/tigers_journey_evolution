import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 37.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppTheme.lightBrown,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 30.r,
            color: Colors.black.withOpacity(0.3),
          ),
          BoxShadow(
            offset: const Offset(3, 4),
            blurRadius: 10.r,
            color: Colors.black.withOpacity(0.5),
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 3.h),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 319.w,
            height: 31.h,
            decoration: BoxDecoration(
              color: AppTheme.brown,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 319.w * percent,
              height: 31.h,
              decoration: BoxDecoration(
                gradient: AppTheme.gradient1,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Text(
            'LOADING',
            style: AppTextStyles.title1_3,
          ),
        ],
      ),
    );
  }
}
