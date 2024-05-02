import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.overlay});

  final EdgeInsets overlay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomIconButton(
            icon: 'assets/png/icons/mail.png',
            width: 25.w,
            height: 18.h,
            hasWarning: true,
            onTap: () => onShowMails(context),
          ),
          SizedBox(width: 8.w),
          CustomIconButton(
            icon: 'assets/png/icons/settings.png',
            width: 28.r,
            height: 28.r,
            onTap: () => onShowSettings(context),
          ),
          const Spacer(),
          LifeIndicator(onTap: () => onShowPremium(context)),
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
      barrierColor: AppTheme.dark.withOpacity(0.8),
      contentDyOffset: 13.h,
      direction: PopoverDirection.top,
      arrowHeight: 0,
      width: 500.w,
      arrowWidth: 600.w,
      height: height,
      bodyBuilder: (context) {
        return const SettingsPopover();
      },
    );
  }

  void onShowPremium(BuildContext context) async {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    await showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: AppTheme.dark.withOpacity(0.8),
      direction: PopoverDirection.top,
      arrowHeight: 0,
      width: 500.w,
      arrowWidth: 600.w,
      contentDyOffset: 11.h,
      height: height,
      bodyBuilder: (context) {
        return const PremiumPopover();
      },
    );
  }

  void onShowMails(BuildContext context) async {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    await showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: AppTheme.dark.withOpacity(0.8),
      direction: PopoverDirection.top,
      arrowHeight: 0,
      width: 500.w,
      arrowWidth: 600.w,
      contentDyOffset: 6.h,
      height: height,
      bodyBuilder: (context) {
        return const MailsPopover();
      },
    );
  }
}
