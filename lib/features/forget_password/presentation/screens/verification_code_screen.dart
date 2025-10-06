import 'dart:developer';

import 'package:e_commerce_app/core/common/widgets/custom_arrow_back.dart';
import 'package:e_commerce_app/core/common/widgets/custom_bottom_container.dart';
import 'package:e_commerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text: 'Confirm Code',
        onTap: () {
          if (formKey.currentState!.validate()) {
            String code = controllers.map((c) => c.text).join();
            log("Entered code: $code");
            GoRouter.of(context).push(Routes.setnewpassword);
          }
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomArrowBack(),
                Text('Verification Code', style: AppTextStyles.font28SemiBold),
                40.ph,
                Image.asset('assets/images/IMG.png'),
                const Spacer(),
                Text(
                  'Enter the 4-digit code sent to your email',
                  style: AppTextStyles.font14Regular.copyWith(
                    color: LightAppColors.grey600,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 60.w,
                      height: 60.h,
                      child: AppTextFormField(
                        controller: controllers[index],
                        maxLines: 1,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        hintText: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        inputTextStyle: AppTextStyles.font20SemiBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
                const Spacer(flex: 2),
                Text(
                  '00:20 resend confirmation code.',
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
