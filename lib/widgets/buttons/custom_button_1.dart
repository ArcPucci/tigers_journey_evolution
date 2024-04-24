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
    this.height,
    this.innerHeight,
    this.textStyle,
    this.width,
    this.innerWidth,
  });

  final String text;
  final String? bg;
  final double? width;
  final double? innerWidth;
  final double? height;
  final double? innerHeight;
  final double opacity;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 327.w,
        height: height ?? 76.h,
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
          width: innerWidth ?? 324.w,
          height: innerHeight ?? 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(bg ?? 'assets/png/buttons/button1.png'),
              fit: BoxFit.fill,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacity,
            child: Text(
              text,
              style: textStyle ?? AppTextStyles.title1_2,
            ),
          ),
        ),
      ),
    );
  }
}
