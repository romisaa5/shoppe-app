import 'package:e_commerce_app/core/di/dependency_injection.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/features/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:e_commerce_app/features/forget_password/presentation/screens/new_password_screen.dart';
import 'package:e_commerce_app/features/forget_password/presentation/screens/verification_code_screen.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/login/presentation/screens/login_screen.dart';
import 'package:e_commerce_app/features/nav_bar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:e_commerce_app/features/nav_bar/presentation/screens/nav_bar.dart';
import 'package:e_commerce_app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_app/features/social_auth/presentation/screens/social_auth_screen.dart';
import 'package:e_commerce_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/resend_otp/resend_otp_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_email/verify_email_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/screens/otp_screen.dart';
import 'package:e_commerce_app/features/verify_email/presentation/screens/verify_email_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          builder: (context, state) {
            return BlocProvider(
              create: (context) => getIt<SignupCubit>(),
              child: SignUpScreen(),
            );
          },
        ),
        GoRoute(
          path: Routes.loginView,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
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
        GoRoute(
          path: Routes.bottnavbar,
          builder: (context, state) =>
              BlocProvider(create: (context) => NavbarCubit(), child: NavBar()),
        ),

        GoRoute(
          path: Routes.otpVerification,
          builder: (context, state) {
            final email = state.extra as String;
            return BlocProvider(
              create: (context) => getIt<VerifyEmailCubit>(),
              child: OtpScreen(email: email),
            );
          },
        ),
        GoRoute(
          path: Routes.varifyEmail,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<ResendOtpCubit>(),
            child: VerifyEmailScreen(),
          ),
        ),
      ],
    );
  }
}
