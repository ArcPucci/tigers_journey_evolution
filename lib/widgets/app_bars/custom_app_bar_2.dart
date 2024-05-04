import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({
    super.key,
    this.hasSettings = true,
    this.hasMails = true,
    this.hasLife = true,
    required this.overlay,
    this.hasAward = true,
  });

  final bool hasSettings;
  final bool hasMails;
  final bool hasLife;
  final bool hasAward;
  final EdgeInsets overlay;

  @override
  Widget build(BuildContext context) {
    return Consumer2<GameProvider, PropertiesProvider>(
      builder: (BuildContext context, value, value2, Widget? child) {
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
                  hasWarning: value2.hasNotification,
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
              Visibility(
                visible: hasAward,
                child: SizedBox(width: 36.r),
              ),
              Visibility(
                visible: hasAward,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: CustomIconButton(
                    icon: 'assets/png/icons/award.png',
                    width: 24.r,
                    height: 26.r,
                    topPadding: 2.r,
                    onTap: () => onShowFacts(context),
                  ),
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
      },
    );
  }

  void onShowSettings(BuildContext context) async {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    await showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      width: 500.w,
      arrowWidth: 600.w,
      arrowHeight: 0,
      arrowDxOffset: 0,
      arrowDyOffset: 0,
      direction: PopoverDirection.top,
      contentDyOffset: 13.h,
      height: height,
      bodyBuilder: (context) {
        return const SettingsPopover(hasMessage: false);
      },
    );
  }

  void onShowFacts(BuildContext context) async {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    await showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      width: 500.w,
      arrowWidth: 600.w,
      arrowHeight: 0,
      arrowDxOffset: 0,
      arrowDyOffset: 0,
      direction: PopoverDirection.top,
      contentDyOffset: 13.h,
      height: height,
      bodyBuilder: (context) {
        return const FactsPopover(hasMessage: false);
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
      width: 500.w,
      arrowWidth: 600.w,
      arrowDxOffset: 0,
      arrowDyOffset: 0,
      arrowHeight: 0,
      contentDyOffset: 11.h,
      direction: PopoverDirection.top,
      height: height,
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
      width: 500.w,
      arrowWidth: 600.w,
      contentDyOffset: 6.h,
      height: height,
      bodyBuilder: (context) {
        return const MailsPopover();
      },
    );
  }

  void onShowAwards(BuildContext context) async {
    final height = 852.h - 46.h - 2.h - 6.h - overlay.top;
    await showPopover(
      context: context,
      transition: PopoverTransition.other,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      width: 500.w,
      arrowWidth: 600.w,
      arrowHeight: 0,
      arrowDxOffset: 0,
      arrowDyOffset: 0,
      direction: PopoverDirection.top,
      contentDyOffset: 13.h,
      height: height,
      bodyBuilder: (context) {
        return const SettingsPopover(hasMessage: false);
      },
    );
  }
}
