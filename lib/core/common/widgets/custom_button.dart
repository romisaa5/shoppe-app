import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.width,
    this.borderreduis,
    this.onTap,
    this.imagePath,
    this.height,
    this.isLoading = false,
    this.textColor,
  });

  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final double? borderreduis;
  final void Function()? onTap;
  final String? imagePath;
  final bool isLoading;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderreduis ?? 10.r),
          color: color ?? LightAppColors.primaryColor,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imagePath != null) ...[
                Image.asset(imagePath!, height: 20.h, width: 20.h),
                SizedBox(width: 8.w),
              ],
              isLoading
                  ? Center(child: CircularProgressIndicator(color: Colors.grey))
                  : Text(
                      text,
                      style: AppTextStyles.font16Regular.copyWith(
                        color: textColor ?? LightAppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
