import 'package:e_commerce_app/core/helper/extentions.dart';
import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/theme/app_texts/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/category_cubit/category_state.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/custom_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListOfCategoryCard extends StatelessWidget {
  const CustomListOfCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Failure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.googleRed,
              ),
            ),
          );
        } else if (state is Success) {
          if (state.data.categories?.isEmpty ?? true) {
            return Center(child: Text('No categories found'));
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: AppTextStyles.font18Regular.copyWith(
                      color: LightAppColors.grey900,
                    ),
                  ),
                  Text(
                    'See All',
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              20.h.ph,
              SizedBox(
                height: 50.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.data.categories?.length ?? 0,
                  itemBuilder: (context, index) {
                    final category = state.data.categories?[index];
                    return CustomCategoryCard(
                      name: category?.name,
                      imageUrl: category?.coverPictureUrl,
                    );
                  },
                  separatorBuilder: (context, index) => 10.w.pw,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
