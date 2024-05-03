import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.text,
    this.onTap,
    this.bg,
    this.opacity = 1,
    this.height,
    this.innerHeight,
    this.textStyle,
    this.width,
    this.innerWidth,
    this.innerWidth2,
    this.innerHeight2,
  });

  final String text;
  final String? bg;
  final double? width;
  final double? innerWidth;
  final double? height;
  final double? innerHeight;
  final double? innerWidth2;
  final double? innerHeight2;
  final double opacity;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 104.w,
        height: height ?? 42.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppTheme.lightBrown,
          boxShadow: [AppTheme.boxShadow2],
        ),
        alignment: Alignment.center,
        child: Container(
          width: innerWidth ?? 100.w,
          height: innerHeight ?? 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppTheme.brown,
            boxShadow: [AppTheme.boxShadow3],
          ),
          alignment: Alignment.center,
          child: Container(
            width: innerWidth2 ?? 96.w,
            height: innerHeight2 ?? 36.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  bg ?? 'assets/png/buttons/green_button_3.png',
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 1),
                  blurRadius: 2.r,
                  color: AppTheme.darkGreen3.withOpacity(0.5),
                ),
                BoxShadow(
                  offset: const Offset(-1, -1),
                  blurRadius: 2.r,
                  color: AppTheme.green2.withOpacity(0.3),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Opacity(
              opacity: opacity,
              child: Text(
                text,
                style: AppTextStyles.textStyle6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
