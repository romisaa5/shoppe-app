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

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Confirm Mail',
        onTap: () {
          if (formKey.currentState!.validate()) {
            GoRouter.of(context).push(Routes.verificationScreen);
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
                Text('Forgot Password', style: AppTextStyles.font28SemiBold),
                40.ph,
                Image.asset('assets/images/IMG.png'),
                Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email Address',
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.grey600,
                    ),
                  ),
                ),
                AppTextFormField(
                  controller: emailController,
                  hintText: 'Enter your Email',
                  isUnderline: true,
                  validator: (value) => ValidationMethods.validateEmail(value),
                ),
                Spacer(flex: 2),
                Text(
                  'Please write your email to receive a confirmation code to set a new password.',
                  style: AppTextStyles.font14Regular.copyWith(
                    color: LightAppColors.grey600,
                  ),
                  textAlign: TextAlign.center,
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
