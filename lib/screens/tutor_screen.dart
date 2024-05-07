import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class TutorScreen extends StatelessWidget {
  const TutorScreen({super.key, required this.screen});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Consumer2<IntroProvider, GameProvider>(
      builder: (BuildContext context, value, value2, Widget? child) {
        return Material(
          child: Stack(
            children: [
              Positioned.fill(child: screen),
              Visibility(
                visible: value.currentPath != '/map/game' || value2.hasAppBar,
                child: Positioned(
                  top: 2.h + overlay.top,
                  left: 0,
                  right: 0,
                  child: Center(child: CustomAppBar(overlay: overlay)),
                ),
              ),
              Visibility(
                visible: value.back,
                child: Positioned.fill(
                  child: Container(color: AppTheme.dark.withOpacity(0.8)),
                ),
              ),
              Visibility(
                visible: !value.loadingGame,
                child: Positioned(
                  top: 2.h + overlay.top,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CustomAppBar2(
                      hasSettings: value.hasSettingsButton,
                      hasMails: value.hasMailsButton,
                      hasLife: value.lifeIndicator,
                      hasAward: value.awardVisible ||
                          (value.awardReached && value.loadingGame),
                      overlay: overlay,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: value.currentPath != '/map/game' || value.tutor,
                child: Positioned(
                  bottom: 0,
                  child: MessageBox(
                    text: value.text,
                    hasNextButton2: value.awardVisible,
                    hasNextButton: value.hasNextButton,
                    hasInfoIcon: value.hasInfoIcon,
                    textStyle: value.loadingGame
                        ? AppTextStyles.textStyle3.copyWith(
                            shadows: [],
                            color: AppTheme.dark4,
                          )
                        : null,
                    onNext2: value.onSkipAward,
                    onNext: value.onNext,
                  ),
                ),
              ),
              Visibility(
                visible: value.loadingGame ||
                    (value2.selected != -1 &&
                    value.currentPath == '/map/game'),
                child: Positioned.fill(
                  child: Material(color: Colors.transparent),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
