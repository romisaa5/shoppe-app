import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/utils/app_icons.dart';
import 'package:e_commerce_app/features/verify_email/presentation/widgets/custom_verify_email_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              80.h.ph,
              Text(
                'Verify Email',
                style: AppTextStyles.font24SemiBold.copyWith(
                  color: LightAppColors.primaryColor,
                ),
              ),
              40.h.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.verifyIcon,
                    height: 200.h,
                    width: 200.w,
                  ),
                ],
              ),
              25.h.ph,
              Text(
                'Please enter your email address to verify your account. We have sent a verification code to your email.',
                textAlign: TextAlign.center,
                style: AppTextStyles.font16Regular.copyWith(
                  color: LightAppColors.grey600,
                ),
              ),
              20.ph,
              CustomVerifyEmailForm(),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }
}
