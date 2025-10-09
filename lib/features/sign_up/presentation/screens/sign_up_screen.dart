import 'package:e_commerce_app/core/common/widgets/custom_arrow_back.dart';
import 'package:e_commerce_app/core/common/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/sign_up/presentation/widgets/remember_me_switch.dart';
import 'package:e_commerce_app/features/sign_up/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:e_commerce_app/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Sign Up',
        onTap: () {
          validateThenDoSignup(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              20.ph,
              CustomArrowBack(),
              Text('Sign Up', style: AppTextStyles.font28SemiBold),
              20.ph,
              SignUpForm(formKey: context.read<SignupCubit>().formKey),
              40.ph,
              RememberMeSwitch(),
              20.ph,
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
                          GoRouter.of(context).push(Routes.loginView);
                        },
                    ),
                  ],
                ),
              ),
              SignupBlocListener(),
              25.ph,
            ],
          ),
        ),
      ),
    );
  }
}
