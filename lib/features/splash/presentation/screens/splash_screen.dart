import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _animate = true;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      GoRouter.of(context).go(Routes.welcomeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = context.height;
    return Scaffold(
      backgroundColor: LightAppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeOutBack,
              top: _animate ? screenHeight / 2 - 75 : screenHeight,
              left: 0,
              right: 0,
              child: Center(
                child: SvgPicture.asset('assets/icons/Logo.svg', height: 36.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
