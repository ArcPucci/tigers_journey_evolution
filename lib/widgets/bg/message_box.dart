import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    this.onNext,
    required this.text,
    this.hasNextButton = true,
    this.hasNextButton2 = false,
    this.hasInfoIcon = true,
    this.textStyle,
    this.verticalPadding,
    this.onNext2,
  });

  final VoidCallback? onNext;
  final VoidCallback? onNext2;
  final String text;
  final TextStyle? textStyle;
  final bool hasNextButton;
  final bool hasInfoIcon;
  final bool hasNextButton2;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: hasNextButton,
          child: Padding(
            padding: EdgeInsets.only(right: 11.w),
            child: GestureDetector(
              onTap: onNext,
              child: Container(
                width: 37.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  border: Border.all(
                    width: 1.sp,
                    color: AppTheme.lightYellow.withOpacity(0.5),
                  ),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/png/icons/next2.png',
                  width: 14.w,
                  height: 9.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: hasNextButton2,
          child: Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: GestureDetector(
              onTap: onNext2,
              child: Image.asset(
                'assets/png/icons/next.png',
                width: 40.w,
                height: 34.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Stack(
          children: [
            Container(
              width: 393.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/bg/message_bg.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 22.w,
                vertical: verticalPadding ?? 50.h,
              ),
              child: Text(
                text,
                style: textStyle ??
                    AppTextStyles.title2_1.copyWith(
                      color: AppTheme.dark4,
                      shadows: [],
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Visibility(
              visible: hasInfoIcon,
              child: Positioned(
                left: 16.w,
                top: 18.h,
                child: Image.asset(
                  'assets/png/icons/info.png',
                  width: 19.w,
                  height: 22.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
