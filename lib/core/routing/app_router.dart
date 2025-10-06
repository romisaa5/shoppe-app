import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/features/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:e_commerce_app/features/forget_password/presentation/screens/new_password_screen.dart';
import 'package:e_commerce_app/features/forget_password/presentation/screens/verification_code_screen.dart';
import 'package:e_commerce_app/features/login/presentation/screens/login_screen.dart';
import 'package:e_commerce_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:e_commerce_app/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_app/features/social_auth/presentation/screens/social_auth_screen.dart';
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
        GoRoute(
          path: Routes.socialAuthScreen,
          builder: (context, state) => SocialAuthScreen(),
        ),
        GoRoute(
          path: Routes.registerView,
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: Routes.loginView,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: Routes.forgetpasssword,
          builder: (context, state) => ForgetPasswordScreen(),
        ),
        GoRoute(
          path: Routes.verificationScreen,
          builder: (context, state) => VerificationCodeScreen(),
        ),
        GoRoute(
          path: Routes.setnewpassword,
          builder: (context, state) => NewPasswordScreen(),
        ),
      ],
    );
  }
}
