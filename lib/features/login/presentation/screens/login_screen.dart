import 'package:e_commerce_app/core/common/widgets/custom_arrow_back.dart';
import 'package:e_commerce_app/core/common/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/features/login/presentation/widgets/login_form.dart';
import 'package:e_commerce_app/features/sign_up/presentation/widgets/remember_me_switch.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Login',
        onTap: () {
          if (formKey.currentState!.validate()) {
            GoRouter.of(context).go(Routes.bottnavbar);
          }
        },
      ),
      body: SafeArea(
        child: Padding(
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
              Spacer(flex: 2),
              LoginForm(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              20.ph,
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
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
              ),
              20.ph,
              RememberMeSwitch(),
              Spacer(),
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
              Spacer(flex: 2),
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
              20.ph,
            ],
          ),
        ),
      ),
    );
  }
}
