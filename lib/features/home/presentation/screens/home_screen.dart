import 'package:e_commerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          45.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: LightAppColors.grey200,
                child: SvgPicture.asset(AppIcons.listIcon),
              ),
              CircleAvatar(
                radius: 24.r,
                backgroundColor: LightAppColors.grey200,
                child: SvgPicture.asset(AppIcons.bagIcon),
              ),
            ],
          ),
          20.h.ph,
          Text('Hello', style: AppTextStyles.font28SemiBold),

          5.h.ph,
          Text(
            'Welcome to Laza.',
            style: AppTextStyles.font16Regular.copyWith(
              color: LightAppColors.grey600,
            ),
          ),
          20.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppTextFormField(
                  hintText: 'Search Product',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SvgPicture.asset(
                      AppIcons.searchIcon,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              15.w.pw,
              Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: LightAppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  Icons.mic,
                  color: LightAppColors.white,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
