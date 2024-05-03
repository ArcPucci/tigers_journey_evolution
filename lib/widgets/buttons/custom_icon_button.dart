import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.onTap,
    this.hasWarning = false,
    this.topPadding,
  });

  final String icon;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool hasWarning;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [AppTheme.boxShadow1],
              gradient: AppTheme.radialGradient1,
            ),
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppTheme.bgGradient,
                    border: GradientBoxBorder(
                      gradient: AppTheme.whiteBorderGradient,
                      width: 0.1.sp,
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: topPadding ?? 0),
                  child: Image.asset(
                    icon,
                    width: width,
                    height: height,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: hasWarning,
            child: Positioned(
              right: 0,
              top: 0,
              child: Image.asset(
                'assets/png/icons/warning.png',
                width: 14.r,
                height: 14.r,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
