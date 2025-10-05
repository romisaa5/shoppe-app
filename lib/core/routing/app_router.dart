import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:e_commerce_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: Routes.splash,
      routes: [
        GoRoute(
          path: Routes.splash,
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: Routes.welcomeView,
          builder: (context, state) => OnboardingScreen(),
        ),
      ],
    );
  }
}
