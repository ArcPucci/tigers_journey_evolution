import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class CustomIconButton2 extends StatelessWidget {
  const CustomIconButton2({
    super.key,
    this.boxShadow,
    required this.icon,
    this.width,
    this.height,
    this.onTap,
    this.borderGradient,
    this.bgGradient,
    this.bgColor,
    required this.size,
    this.iconColor,
    this.opacity,
    this.padding,
  });

  final BoxShadow? boxShadow;
  final double size;
  final String icon;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Gradient? borderGradient;
  final Gradient? bgGradient;
  final Color? bgColor;
  final Color? iconColor;
  final double? opacity;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 100.r,
        height: height ?? 100.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          gradient: bgGradient,
          boxShadow: [AppTheme.boxShadow6],
          border: borderGradient != null
              ? GradientBoxBorder(
                  gradient: borderGradient!,
                  width: 0.14.sp,
                )
              : null,
        ),
        alignment: Alignment.center,
        padding: padding,
        child: Image.asset(
          icon,
          width: size,
          height: size,
          color: iconColor,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
