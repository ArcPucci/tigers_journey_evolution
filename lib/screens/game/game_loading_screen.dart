import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class GameLoadingScreen extends StatelessWidget {
  const GameLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          hasCloseButton: true,
          bg: value.level.loadingBG,
          blurredColor: AppTheme.dark.withOpacity(0.58),
          child: Column(
            children: [
              SizedBox(height: 344.h),
              Text(
                value.level.name,
                style: AppTextStyles.title1_2.copyWith(
                  shadows: [],
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: Text(
                  'Level ${value.level.id + 1}',
                  style: AppTextStyles.textStyle8,
                ),
              ),
              SizedBox(height: 129.h),
              SizedBox(
                height: 76.h,
                child: Center(
                  child: value.loaded
                      ? CustomButton1(text: 'START', onTap: value.onStart)
                      : LoadingIndicator(percent: value.loading),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
