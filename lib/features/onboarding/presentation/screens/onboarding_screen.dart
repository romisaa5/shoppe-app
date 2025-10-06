import 'dart:ui';
import 'package:e_commerce_app/core/common/widgets/custom_button.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: LightAppColors.purbleGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned(
            top: 381.h,
            left: -74.w,
            child: _buildGlowCircle(Colors.white.withValues(alpha: .5)),
          ),
          Positioned(
            top: 503.h,
            left: 194.w,
            child: _buildGlowCircle(Colors.white.withValues(alpha: .5)),
          ),
          Positioned(
            top: -81.h,
            left: -42.w,
            child: _buildGlowCircle(Colors.white.withValues(alpha: .5)),
          ),
          Image.asset(
            'assets/images/img_onboard.png',
            height: 620.h,
            width: 375.w,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 540.h,
            left: 15.w,
            child: Container(
              height: 255.h,
              width: 340.w,
              decoration: BoxDecoration(
                color: LightAppColors.background,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  25.ph,
                  Text(
                    'Look Good, Feel Good',
                    style: AppTextStyles.font24SemiBold,
                    textAlign: TextAlign.center,
                  ),
                  10.ph,
                  Text(
                    'Create your individual & unique style and look amazing everyday.',
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: 'Men',
                        width: 150.w,
                        color: selectedGender == 'Men'
                            ? LightAppColors.primaryColor
                            : LightAppColors.grey400,
                        textColor: selectedGender == 'Men'
                            ? Colors.white
                            : LightAppColors.grey600,
                        onTap: () {
                          setState(() {
                            selectedGender = 'Men';
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            GoRouter.of(context).push(Routes.socialAuthScreen);
                          });
                        },
                      ),
                      CustomButton(
                        text: 'Women',
                        width: 150.w,
                        color: selectedGender == 'Women'
                            ? LightAppColors.primaryColor
                            : LightAppColors.grey400,
                        textColor: selectedGender == 'Women'
                            ? Colors.white
                            : LightAppColors.grey600,
                        onTap: () {
                          setState(() {
                            selectedGender = 'Women';
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            GoRouter.of(context).push(Routes.socialAuthScreen);
                          });
                        },
                      ),
                    ],
                  ),

                  20.ph,
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(Routes.socialAuthScreen);
                    },
                    child: Text(
                      'Skip',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.grey600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlowCircle(Color color) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
