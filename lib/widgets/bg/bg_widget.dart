import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({
    super.key,
    required this.child,
    required this.bg,
    this.blurredColor,
    this.hasCloseButton = false,
    this.onClose,
  });

  final String bg;
  final Color? blurredColor;
  final Widget child;
  final bool hasCloseButton;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(bg, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: blurredColor),
          ),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: child,
            ),
          ),
          if (hasCloseButton)
            Positioned(
              top: 16.h,
              right: 25.w,
              child: SafeArea(
                child: GestureDetector(
                  onTap: onClose ?? context.pop,
                  child: Image.asset(
                    'assets/png/icons/close.png',
                    width: 28.r,
                    height: 28.r,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
