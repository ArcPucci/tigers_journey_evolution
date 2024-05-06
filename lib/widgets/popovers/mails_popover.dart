import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/bg/message_box.dart';

class MailsPopover extends StatefulWidget {
  const MailsPopover({super.key});

  @override
  State<MailsPopover> createState() => _MailsPopoverState();
}

class _MailsPopoverState extends State<MailsPopover> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<PropertiesProvider>(
      context,
      listen: false,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.openMails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PropertiesProvider, IntroProvider>(
      builder: (BuildContext context, value, value2, Widget? child) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.w + (36.r - 17.w) / 2),
                    child: Image.asset(
                      'assets/png/icons/down.png',
                      width: 17.w,
                      height: 12.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        value.receivedMails.length,
                        (index) {
                          final total = value.receivedMails.length - 1;
                          final mail = value.receivedMails[total - index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Opacity(
                              opacity: index == 0 || index == 1 ? 1 : 0.5,
                              child: SizedBox(
                                width: 361.w,
                                height: 89.h,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      width: 361.w,
                                      height: 84.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: AppTheme.bgGradient,
                                        border: GradientBoxBorder(
                                          gradient: AppTheme.bgGradient,
                                          width: 0.1.sp,
                                        ),
                                        boxShadow: [AppTheme.boxShadow1],
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 15.w, right: 37.w),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        mail,
                                        style: AppTextStyles.textStyle7,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 5.w,
                                      child: Transform.rotate(
                                        angle: (50 / 180) * pi,
                                        child: GestureDetector(
                                          onTap: () =>
                                              value.onDelete(total - index),
                                          child: Image.asset(
                                            'assets/png/icons/plus.png',
                                            width: 24.r,
                                            height: 24.r,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: MessageBox(
                    text: value2.index < 5
                        ? value2.text
                        : "You can see all notifications here",
                    hasNextButton: value2.hasNextButton,
                    hasInfoIcon: value2.hasInfoIcon,
                    onNext: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                      value2.onNext();
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: MessageBox(
                text: value2.index < 5
                    ? value2.text
                    : "You can see all notifications here. You will receive notifications every day",
                hasNextButton: value2.hasNextButton,
                hasInfoIcon: value2.hasInfoIcon,
                onNext: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                  value2.onNext();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
