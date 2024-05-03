import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class FactScreen extends StatelessWidget {
  const FactScreen({super.key, required this.overlay});

  final EdgeInsets overlay;

  @override
  Widget build(BuildContext context) {
    return Consumer<FactsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return BGWidget(
          bg: value.currentPage.image,
          blurredColor: AppTheme.dark.withOpacity(0.4),
          child: Column(
            children: [
              Spacer(),
              MessageBox(
                text: value.currentPage.content,
                hasInfoIcon: false,
                verticalPadding: 30.h,
                onNext: value.onNext,
                textStyle: AppTextStyles.textStyle3.copyWith(
                  color: AppTheme.dark4,
                  shadows: [],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
