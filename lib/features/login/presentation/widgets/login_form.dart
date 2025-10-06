import 'package:e_commerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/helper/validation_methods.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: AppTextStyles.font14Regular.copyWith(
              color: LightAppColors.grey600,
            ),
          ),
          AppTextFormField(
            controller: emailController,
            hintText: 'Enter your Email',
            isUnderline: true,
            validator: (value) => ValidationMethods.validateEmail(value),
          ),
          20.ph,
          Text(
            'Password',
            style: AppTextStyles.font14Regular.copyWith(
              color: LightAppColors.grey600,
            ),
          ),
          AppTextFormField(
            validator: (value) => ValidationMethods.validatePassword(value),
            isObscureText: true,
            controller: passwordController,
            maxLines: 1,
            hintText: 'Enter your Password',
            isUnderline: true,
          ),
        ],
      ),
    );
  }
}
