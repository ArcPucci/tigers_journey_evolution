import 'dart:math';

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
              Consumer<PropertiesProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Container(
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
                          value.soundOn
                              ? 'assets/png/icons/sound_on.png'
                              : 'assets/png/icons/sound_off.png',
                          width: 46.w,
                          height: 48.h,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          value.muted
                              ? 'assets/png/icons/music_off.png'
                              : 'assets/png/icons/music_on.png',
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
                        GestureDetector(
                          onTap: () => showQuitDialog(context),
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
            text:
                "Click on settings to turn sound and music on or off. You can find help information or exit the application",
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
