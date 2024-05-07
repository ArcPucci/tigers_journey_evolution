import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class SettingsPopover extends StatelessWidget {
  const SettingsPopover({
    super.key,
    this.hasMessage = true,
  });

  final bool hasMessage;

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
              Consumer2<PropertiesProvider, IntroProvider>(
                builder: (BuildContext context, value, value2, Widget? child) {
                  return Container(
                    width: 182.w,
                    height: 81.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/png/box.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 46.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            value2.onTutor();
                          },
                          child: Image.asset(
                            'assets/png/icons/question.png',
                            width: 28.w,
                            height: 48.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await showQuitDialog(context)) exit(0);
                          },
                          child: Image.asset(
                            'assets/png/icons/exit.png',
                            width: 36.w,
                            height: 48.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
        Visibility(
          visible: hasMessage,
          child: const MessageBox(
            hasNextButton: false,
            text: "Click Settings to find help or exit the app.",
          ),
        ),
      ],
    );
  }

  Future<bool> showQuitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return const Center(child: ExitDialog());
      },
    );
  }
}
