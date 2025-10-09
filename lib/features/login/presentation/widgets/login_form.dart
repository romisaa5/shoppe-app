import 'package:e_commerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/common/widgets/password_validations.dart';
import 'package:e_commerce_app/core/helper/app_regex.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/helper/validation_methods.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Enter a valid email';
              }
            },
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
          15.h.ph,
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
