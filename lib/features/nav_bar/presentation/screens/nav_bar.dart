import 'package:e_commerce_app/core/theme/app_colors/light_app_colors.dart';
import 'package:e_commerce_app/core/utils/app_icons.dart';
import 'package:e_commerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:e_commerce_app/features/nav_bar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  static List<Widget> views = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        final currentIndex = state is NavbarUpdate ? state.currentIndex : 0;
        return Scaffold(
          body: views[currentIndex],
          bottomNavigationBar: Container(
            height: 75.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 2,
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (newIndex) {
                context.read<NavbarCubit>().updateIndex(newIndex);
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: LightAppColors.primaryColor,
              unselectedItemColor: LightAppColors.grey600,
              items: [
                BottomNavigationBarItem(
                  icon: currentIndex == 0
                      ? const SizedBox(height: 1)
                      : SvgPicture.asset(
                          AppIcons.homeIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 1
                      ? const SizedBox(height: 1)
                      : SvgPicture.asset(
                          AppIcons.favoriteIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 2
                      ? const SizedBox(height: 1)
                      : SvgPicture.asset(
                          AppIcons.bagIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 3
                      ? const SizedBox(height: 1)
                      : SvgPicture.asset(
                          AppIcons.cardIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                  label: 'Cards',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
