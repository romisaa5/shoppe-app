import 'package:e_commerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/common/widgets/password_validations.dart';
import 'package:e_commerce_app/core/helper/app_regex.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/helper/validation_methods.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/features/sign_up/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  initState() {
    firstNameController = context.read<SignupCubit>().firstNameController;
    lastNameController = context.read<SignupCubit>().lastNameController;
    emailController = context.read<SignupCubit>().emailController;
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
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
            'Name',
            style: AppTextStyles.font14Regular.copyWith(
              color: LightAppColors.grey600,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: firstNameController,
                  hintText: 'First Name',
                  isUnderline: true,
                  validator: (value) =>
                      ValidationMethods.validateUsername(value),
                ),
              ),
              20.w.pw,
              Expanded(
                child: AppTextFormField(
                  controller: lastNameController,
                  hintText: 'Last Name',
                  isUnderline: true,
                  validator: (value) =>
                      ValidationMethods.validateUsername(value),
                ),
              ),
            ],
          ),
          20.ph,
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
          15.h.ph,
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
