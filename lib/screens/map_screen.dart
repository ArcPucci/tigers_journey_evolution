import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/screens/screens.dart';
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
    final provider = Provider.of<IntroProvider>(context, listen: false);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    provider.init();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (provider.awardReached && !provider.hasAward) {
        await onShowAwardsMessage(context);
        provider.showAward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<IntroProvider, GameProvider>(
      builder: (BuildContext context, value, value2, Widget? child) {
        return TutorScreen(
          screen: Stack(
            children: [
              Positioned.fill(
                child: CheckPointMap(
                  reachedLevel: value2.reachedLevel,
                  onStart: (level) {
                    if (value2.reachedLevel < level.id) return;
                    if (value2.health == 0 && !value2.premium) {
                      onTapPremium(context);
                      return;
                    }
                    _controller.reset();
                    value.onEnter(level);
                    _controller.forward();
                  },
                ),
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
            ],
          ),
        );
      },
    );
  }

  Future<void> onShowAwardsMessage(BuildContext context) async {
    await showDialog(
      context: context,
      barrierColor: AppTheme.dark.withOpacity(0.8),
      useSafeArea: false,
      builder: (context) {
        return AwardsDialog();
      },
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
