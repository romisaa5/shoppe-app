import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final InputBorder? errorBorder;
  final int? maxLines;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.focusNode,
    this.onChanged,
    this.errorBorder,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      cursorColor: LightAppColors.primaryColor,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 201, 200, 200),
                width: 1.3.w,
              ),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 201, 200, 200),
                width: 1.w,
              ),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(color: colorScheme.error, width: 1.w),
            ),
        focusedErrorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(color: colorScheme.error, width: 1.w),
            ),
        hintStyle:
            hintStyle ??
            AppTextStyles.font14Regular.copyWith(
              color: colorScheme.secondary.withValues(alpha: .5),
            ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? Colors.white,
        filled: true,
      ),
      focusNode: focusNode,
      obscureText: isObscureText ?? false,
      style:
          inputTextStyle ??
          AppTextStyles.font16Regular.copyWith(color: colorScheme.secondary),
    );
  }
}
