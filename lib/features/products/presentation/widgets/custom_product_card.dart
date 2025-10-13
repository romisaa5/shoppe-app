import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 200.h,
      color: const Color(0xFFE0E0E0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160.w,
            height: 120.h,
            color: const Color(0xFFBDBDBD),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 20.h,
                  color: const Color(0xFFBDBDBD),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 60.w,
                  height: 20.h,
                  color: const Color(0xFFBDBDBD),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
