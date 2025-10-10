import 'package:e_commerce_app/core/di/dependency_injection.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:e_commerce_app/features/verify_email/presentation/widgets/custom_otp_verify_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors/light_app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerifyOtpCubit>(),
      child: Scaffold(
        backgroundColor: LightAppColors.background,
        appBar: AppBar(
          backgroundColor: LightAppColors.background,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          iconTheme: const IconThemeData(color: LightAppColors.primaryColor),
          centerTitle: true,
          title: Text(
            'Enter OTP',
            style: AppTextStyles.font24SemiBold.copyWith(
              color: LightAppColors.primaryColor,
            ),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  32.h.ph,
                  Image.asset(AppImages.img),
                  24.h.ph,
                  Text(
                    "Enter the verification code",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font24Bold.copyWith(
                      color: LightAppColors.grey900,
                    ),
                  ),
                  12.ph,
                  Text(
                    "We have sent a 6-digit code to your email address.",
                    style: AppTextStyles.font16Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  40.h.ph,
                  CustomOtpVerifyForm(email: email),
                  20.h.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
