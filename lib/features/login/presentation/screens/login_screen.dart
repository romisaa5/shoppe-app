import 'package:e_commerce_app/core/common/widgets/custom_arrow_back.dart';
import 'package:e_commerce_app/core/common/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:e_commerce_app/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:e_commerce_app/features/login/presentation/widgets/login_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Login',
        onTap: () {
          validateThenDoLogin(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              20.ph,
              CustomArrowBack(),
              Text('Welcome', style: AppTextStyles.font28SemiBold),
              5.ph,
              Text(
                'Please enter your data to continue',
                style: AppTextStyles.font14Regular.copyWith(
                  color: LightAppColors.grey500,
                ),
              ),
              40.h.ph,
              LoginForm(formKey: context.read<LoginCubit>().formKey),
              20.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(Routes.varifyEmail);
                    },
                    child: Text(
                      'Verify Email ?',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(Routes.forgetpasssword);
                    },
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.googleRed,
                      ),
                    ),
                  ),
                ],
              ),
              80.h.ph,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'By connecting your account confirm that you agree with our',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.grey500,
                      ),
                    ),
                    TextSpan(
                      text: ' Terms and Conditions',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              60.h.ph,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account? ',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.grey800,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          GoRouter.of(context).push(Routes.registerView);
                        },
                    ),
                  ],
                ),
              ),
              LoginBlocListener(),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
