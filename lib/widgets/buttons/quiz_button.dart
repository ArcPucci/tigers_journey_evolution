import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    this.onTap,
    this.selected = false,
    required this.answer,
  });

  final VoidCallback? onTap;
  final bool selected;
  final Answer answer;

  Color getColor() {
    if (selected) {
      if (answer.correct == Correctness.correct) return AppTheme.lightGreen2;
      if (answer.correct == Correctness.neutral) return AppTheme.yellow;
      if (answer.correct == Correctness.wrong) return AppTheme.red;
    }
    return AppTheme.lightYellow;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 329.w,
        height: 51.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: getColor(),
          border: Border.all(
            width: 3.sp,
            color: AppTheme.darkRed.withOpacity(0.4),
          ),
          boxShadow: [AppTheme.boxShadow5],
        ),
        alignment: Alignment.center,
        child: Text(
          answer.answer,
          style: AppTextStyles.title2_1.copyWith(
            shadows: [],
            color: AppTheme.dark4,
          ),
        ),
      ),
    );
  }
}
