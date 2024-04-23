import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.text,
    this.onTap,
    this.bg,
    this.opacity = 1,
  });

  final String text;
  final String? bg;
  final double opacity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 76.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppTheme.lightBrown,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 30.r,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Container(
          width: 324.w,
          height: 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(bg ?? 'assets/png/buttons/button1.png'),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacity,
            child: Text(
              text,
              style: AppTextStyles.title1_2,
            ),
          ),
        ),
      ),
    );
  }
}
