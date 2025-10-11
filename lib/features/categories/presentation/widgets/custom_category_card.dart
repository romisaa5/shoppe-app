import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_app/core/helper/extentions.dart';

class CustomCategoryCard extends StatelessWidget {
  final String? name;
  final String? imageUrl;

  const CustomCategoryCard({super.key, this.name, this.imageUrl});

  Future<bool> _isValidSvg(String url) async {
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200 &&
          response.data.toString().contains('<svg')) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final imgUrl = imageUrl ?? '';
    return Container(
      width: 150.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: LightAppColors.grey100,
      ),
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: LightAppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: FutureBuilder<bool>(
              future: _isValidSvg(imgUrl),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }
                if (snapshot.hasError || snapshot.data == false) {
                  return Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                    size: 28,
                  );
                }
                return SvgPicture.network(
                  imgUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          8.w.pw,
          Expanded(
            child: Text(
              name ?? 'Unknown',
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.grey900,
                fontSize: 12.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
