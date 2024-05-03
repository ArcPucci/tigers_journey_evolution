import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class FactLoadingScreen extends StatelessWidget {
  const FactLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FactsProvider>(
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
                textAlign: TextAlign.center,
                style: AppTextStyles.title1_2.copyWith(
                  shadows: [],
                ),
              ),
              SizedBox(height: 171.h),
              LoadingIndicator(percent: value.loading),
            ],
          ),
        );
      },
    );
  }
}
