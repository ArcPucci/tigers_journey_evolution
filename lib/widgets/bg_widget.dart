import 'package:flutter/material.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';

class BGWidget extends StatelessWidget {
  const BGWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/bg/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: AppTheme.dark.withOpacity(0.3)),
          ),
          Positioned.fill(child: SafeArea(child: child)),
        ],
      ),
    );
  }
}
