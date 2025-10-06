import 'package:e_commerce_app/core/common/widgets/custom_arrow_back.dart';
import 'package:e_commerce_app/core/common/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/helper/validation_methods.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Reset Password',
        onTap: () {
          if (formKey.currentState!.validate()) {
            GoRouter.of(context).push(Routes.loginView);
          }
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomArrowBack(),
                Text('New Password', style: AppTextStyles.font28SemiBold),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                  ),
                ),
                AppTextFormField(
                  validator: (value) =>
                      ValidationMethods.validatePassword(value),
                  isObscureText: true,
                  controller: passwordController,
                  maxLines: 1,
                  hintText: 'Enter your Password',
                  isUnderline: true,
                ),
                20.ph,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                  ),
                ),
                AppTextFormField(
                  validator: (value) =>
                      ValidationMethods.validateConfirmPassword(value),
                  isObscureText: true,
                  controller: confirmPasswordController,
                  maxLines: 1,
                  hintText: 'Enter your Password',
                  isUnderline: true,
                ),
                Spacer(),
                Text(
                  'Please write your new password.',
                  style: AppTextStyles.font14Regular.copyWith(
                    color: LightAppColors.grey600,
                  ),
                ),
                20.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
