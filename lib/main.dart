import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tigers_journey_evolution/providers/providers.dart';
import 'package:tigers_journey_evolution/screens/screens.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      runApp(
        ScreenUtilInit(
          designSize: const Size(393, 852),
          builder: (context, child) {
            final overlay = MediaQuery.of(context).padding;
            return MyApp(overlay: overlay);
          },
        ),
      );
    },
    (error, stack) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: stack);
    },
  );
}

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.overlay});

  final EdgeInsets overlay;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const MainScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'onboarding',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const OnboardingScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'map',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const MapScreen(),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'game_loading',
                      pageBuilder: (context, state) {
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: const GameLoadingScreen(),
                        );
                      },
                      routes: [
                        GoRoute(
                          path: 'game',
                          pageBuilder: (context, state) {
                            return buildPageWithDefaultTransition(
                              context: context,
                              state: state,
                              child: GameScreen(overlay: widget.overlay),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameProvider(router: _router),
        ),
        ChangeNotifierProvider(
          create: (context) => IntroProvider(
            router: _router,
            gameProvider: Provider.of(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
