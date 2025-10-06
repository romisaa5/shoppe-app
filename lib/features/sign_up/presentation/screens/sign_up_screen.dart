import 'package:e_commerce_app/core/common/widgets/custom_arrow_back.dart';
import 'package:e_commerce_app/core/common/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/features/sign_up/presentation/widgets/remember_me_switch.dart';
import 'package:e_commerce_app/features/sign_up/presentation/widgets/sign_up_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Sign Up',
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
              Text('Sign Up', style: AppTextStyles.font28SemiBold),
              Spacer(),
              SignUpForm(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
                usernameController: usernameController,
              ),
              40.ph,
              RememberMeSwitch(),
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
                          GoRouter.of(context).push(Routes.loginView);
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
}
