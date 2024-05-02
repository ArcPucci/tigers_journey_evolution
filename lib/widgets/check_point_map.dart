import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tigers_journey_evolution/models/models.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class CheckPointMap extends StatelessWidget {
  const CheckPointMap({super.key, required this.onStart});

  final void Function(Level level) onStart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/bg/map.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Stack(
              children: List.generate(
                levels.length,
                (index) {
                  final level = levels[index];
                  final checkPoint = level.checkPoint;
                  final selected = index == 0;
                  final passed = index >= 5;
                  return Positioned(
                    left: checkPoint.left,
                    top: checkPoint.top,
                    right: checkPoint.right,
                    child: CheckPointStar(
                      index: index + 1,
                      selected: selected,
                      passed: passed,
                      onTap: () => onStart(level),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
