import 'package:e_commerce_app/core/common/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SocialAuthScreen extends StatelessWidget {
  const SocialAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Create an Account',
        onTap: () {
          GoRouter.of(context).go(Routes.registerView);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.ph,
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: LightAppColors.grey200,
                  radius: 23.r,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Text('Let’s Get Started', style: AppTextStyles.font28SemiBold),
              Spacer(),
              _buildSocialButton(
                assetPath: 'assets/icons/Facebook.svg',
                text: 'Facebook',
                color: LightAppColors.facebookBlue,
              ),
              10.ph,
              _buildSocialButton(
                assetPath: 'assets/icons/Twitter.svg',
                text: 'Twitter',
                color: LightAppColors.twitterBabyBlue,
              ),
              10.ph,
              _buildSocialButton(
                assetPath: 'assets/icons/Google.svg',
                text: 'Google',
                color: LightAppColors.googleRed,
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.grey800,
                      ),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          GoRouter.of(context).go(Routes.loginView);
                        },
                    ),
                  ],
                ),
              ),
              25.ph,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String assetPath,
    required String text,
    required Color color,
  }) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetPath, height: 22.h, width: 22.h),
          6.pw,
          Text(
            text,
            style: AppTextStyles.font18Regular.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
