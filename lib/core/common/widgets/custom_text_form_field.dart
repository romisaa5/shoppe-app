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
  final String? hintText;
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
  final bool isUnderline;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
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
    this.isUnderline = false,
    this.keyboardType,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    InputBorder border = isUnderline
        ? UnderlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 201, 200, 200),
              width: 1.2.w,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 201, 200, 200),
              width: 1.2.w,
            ),
          );

    return FormField<String>(
      validator: validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: keyboardType,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              controller: controller,
              onChanged: (value) {
                state.didChange(value);
                onChanged?.call(value);
              },
              focusNode: focusNode,
              obscureText: isObscureText ?? false,
              cursorColor: LightAppColors.primaryColor,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    contentPadding ??
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                focusedBorder:
                    focusedBorder ??
                    border.copyWith(
                      borderSide: BorderSide(
                        color: LightAppColors.primaryColor,
                        width: 1.5.w,
                      ),
                    ),
                enabledBorder: enabledBorder ?? border,
                errorBorder:
                    errorBorder ??
                    border.copyWith(
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: 1.2.w,
                      ),
                    ),
                focusedErrorBorder:
                    errorBorder ??
                    border.copyWith(
                      borderSide: BorderSide(
                        color: colorScheme.error,
                        width: 1.2.w,
                      ),
                    ),

                hintText: hintText,
                hintStyle:
                    hintStyle ??
                    AppTextStyles.font14Regular.copyWith(
                      color: colorScheme.secondary.withValues(alpha: .5),
                    ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                fillColor: backgroundColor ?? Colors.white,
                filled: true,
              ),
              style:
                  inputTextStyle ??
                  AppTextStyles.font16Regular.copyWith(
                    color: colorScheme.secondary,
                  ),
            ),
            if (state.hasError) // ✅ هنا بنعرض الأيقونة + الرسالة
              Padding(
                padding: EdgeInsets.only(top: 6.h, left: 8.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: colorScheme.error,
                      size: 16.sp,
                    ),
                    5.w.horizontalSpace,
                    Flexible(
                      child: Text(
                        state.errorText ?? '',
                        style: AppTextStyles.font12Regular.copyWith(
                          color: colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
