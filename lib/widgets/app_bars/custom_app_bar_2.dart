import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({
    super.key,
    this.hasSettings = true,
    this.hasMails = true,
    this.hasLife = true,
    required this.overlay,
  });

  final bool hasSettings;
  final bool hasMails;
  final bool hasLife;
  final EdgeInsets overlay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.w,
      height: 46.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Visibility(
            visible: hasMails,
            child: CustomIconButton(
              icon: 'assets/png/icons/mail.png',
              width: 25.w,
              height: 18.h,
              hasWarning: true,
              onTap: () => onShowMails(context),
            ),
          ),
          Visibility(
            visible: !hasMails,
            child: SizedBox(width: 36.r),
          ),
          SizedBox(width: 8.w),
          Visibility(
            visible: hasSettings,
            child: CustomIconButton(
              icon: 'assets/png/icons/settings.png',
              width: 28.r,
              height: 28.r,
              onTap: () => onShowSettings(context),
            ),
          ),
          const Spacer(),
          Visibility(
            visible: hasLife,
            child: LifeIndicator(
              onTap: () => onShowPremium(context),
            ),
          ),
        ],
      ),
    );
  }

  void onShowSettings(BuildContext context) async {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    await showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      arrowHeight: 0,
      arrowWidth: 0,
      contentDyOffset: 13.h,
      height: height,
      bodyBuilder: (context) {
        return const SettingsPopover();
      },
    );
  }

  void onShowPremium(BuildContext context) {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      arrowWidth: 0,
      arrowHeight: 0,
      contentDyOffset: 11.h,
      direction: PopoverDirection.top,
      height: height,
      width: 393.w,
      bodyBuilder: (context) {
        return const PremiumPopover(hasMessage: false);
      },
    );
  }

  void onShowMails(BuildContext context) async {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    await showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      direction: PopoverDirection.top,
      arrowHeight: 0,
      arrowWidth: 0,
      contentDyOffset: 6.h,
      height: height,
      bodyBuilder: (context) {
        return const MailsPopover();
      },
    );
  }
}
