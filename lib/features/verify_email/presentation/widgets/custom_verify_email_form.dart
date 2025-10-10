import 'package:e_commerce_app/core/common/widgets/custom_button.dart';
import 'package:e_commerce_app/core/helper/app_regex.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/features/verify_email/presentation/manager/verify_email/verify_email_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/custom_text_form_field.dart';

import 'verify_email_bloc_listener.dart';

class CustomVerifyEmailForm extends StatelessWidget {
  const CustomVerifyEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<VerifyEmailCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            controller: context.read<VerifyEmailCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              final trimmedValue = value?.trim() ?? '';
              if (trimmedValue.isEmpty ||
                  !AppRegex.isEmailValid(trimmedValue)) {
                return 'Please enter a valid email.';
              }
              return null;
            },
          ),
          40.h.ph,
          CustomButton(
            onTap: () {
              validateThenDoNavigation(context);
            },
            text: 'Verify Email',
          ),

          VerifyEmailBlocListener(),
        ],
      ),
    );
  }

  void validateThenDoNavigation(BuildContext context) {
    if (context.read<VerifyEmailCubit>().formKey.currentState!.validate()) {
      context.read<VerifyEmailCubit>().emitVerifyEmailStates();
    }
  }
}
