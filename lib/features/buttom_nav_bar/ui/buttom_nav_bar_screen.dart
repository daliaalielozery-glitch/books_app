import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/features/cart/ui/cart_screen.dart';
import 'package:books_app/features/home/cubit/home_cubit.dart';
import 'package:books_app/features/home/ui/home_screen.dart';
import 'package:books_app/features/profile/ui/profile_screen.dart';
import 'package:books_app/features/wish_list/ui/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../gen/assets.gen.dart';

class ButtomNavBarScreen extends StatefulWidget {
  const ButtomNavBarScreen({super.key});

  @override
  State<ButtomNavBarScreen> createState() => _ButtomNavBarScreenState();
}

class _ButtomNavBarScreenState extends State<ButtomNavBarScreen> {
  int activeindex = 0;

  List<Widget> screens =[

    BlocProvider(
      create: (context) => HomeCubit()..getSlider()..getBestSeller(),
      child: const HomeScreen(),
    ),
  WishListScreen(),
  CartScreen(),
  ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeindex,
        onTap: (index) {
          setState(() {
            activeindex = index;
          });
        },
        selectedItemColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.home,
              colorFilter: ColorFilter.mode(
                activeindex == 0 ? AppColors.primaryColor : Colors.black,
                BlendMode.srcIn
              ),
            ),

            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.category, colorFilter: ColorFilter.mode(
                activeindex == 1 ? AppColors.primaryColor : Colors.black,
                BlendMode.srcIn
            ),),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.bookmark,
              colorFilter: ColorFilter.mode(
                activeindex == 2
                    ? AppColors.primaryColor
                    : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.profile, colorFilter: ColorFilter.mode(
                activeindex == 3 ? AppColors.primaryColor : Colors.black,
                BlendMode.srcIn
            ),),
            label: "",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(child: screens[activeindex]),
      ),
    );
  }
}
