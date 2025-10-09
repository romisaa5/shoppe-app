import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        2.h.ph,
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        2.h.ph,
        buildValidationRow(
          'At least 1 special character',
          hasSpecialCharacters,
        ),
        2.h.ph,
        buildValidationRow('At least 1 number', hasNumber),
        2.h.ph,
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: LightAppColors.grey600,
        ),
        10.pw,
        Text(
          text,
          style: AppTextStyles.font14Regular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated
                ? LightAppColors.primaryColor
                : LightAppColors.grey600,
          ),
        ),
      ],
    );
  }
}
