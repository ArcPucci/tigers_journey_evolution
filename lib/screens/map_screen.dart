import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/intro_provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/utils/utils.dart';
import 'package:tigers_journey_evolution/widgets/widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Consumer<IntroProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Material(
          child: Stack(
            children: [
              Positioned.fill(
                child: CheckPointMap(
                  onStart: (level) {
                    _controller.reset();
                    value.onEnter(level);
                    _controller.forward();
                  },
                ),
              ),
              Positioned(
                top: 2.h + overlay.top,
                left: 0,
                right: 0,
                child: Center(child: CustomAppBar(overlay: overlay)),
              ),
              Visibility(
                visible: value.loadingGame,
                child: Positioned.fill(
                  child: FadeTransition(
                    opacity: _animation,
                    child: Container(
                      color: AppTheme.dark.withOpacity(0.8),
                      child: Image.asset(value.map, fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: value.index < 5,
                child: Positioned.fill(
                  child: Container(color: AppTheme.dark.withOpacity(0.8)),
                ),
              ),
              Positioned(
                top: 2.h + overlay.top,
                left: 0,
                right: 0,
                child: Center(
                  child: CustomAppBar2(
                    hasSettings: value.hasSettingsButton,
                    hasMails: value.hasMailsButton,
                    hasLife: value.lifeIndicator,
                    overlay: overlay,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: MessageBox(
                  text: value.text,
                  hasNextButton: value.hasNextButton,
                  hasInfoIcon: value.hasInfoIcon,
                  onNext: value.onNext,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
