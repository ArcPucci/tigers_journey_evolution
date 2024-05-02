import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/widgets/bg/message_box.dart';

class SettingsPopover extends StatelessWidget {
  const SettingsPopover({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10.h + 36.r + (36.r - 17.w) / 2 + 16.w,
          ),
          child: Image.asset(
            'assets/png/icons/down.png',
            width: 17.w,
            height: 12.h,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          height: 85.h,
          padding: EdgeInsets.only(left: 16.w),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 341.w,
                height: 81.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/box1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 46.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/png/icons/sound_on.png',
                      width: 46.w,
                      height: 48.h,
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'assets/png/icons/music_on.png',
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'assets/png/icons/question.png',
                      width: 28.w,
                      height: 48.h,
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      'assets/png/icons/exit.png',
                      width: 36.w,
                      height: 48.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Transform.rotate(
                    angle: (50 / 180) * pi,
                    child: Image.asset(
                      'assets/png/icons/plus.png',
                      width: 24.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        const MessageBox(
          hasNextButton: false,
          text:
              "Click on settings to turn sound and music on or off. You can find help information or exit the application",
        ),
      ],
    );
  }
}
