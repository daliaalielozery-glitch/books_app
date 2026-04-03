import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/features/auth/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../gen/assets.gen.dart';

class ButtomNavBarScreen extends StatefulWidget {
  const ButtomNavBarScreen({super.key});

  @override
  State<ButtomNavBarScreen> createState() => _ButtomNavBarScreenState();
}

class _ButtomNavBarScreenState extends State<ButtomNavBarScreen> {
  int activeindex = 0;
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
    );
  }
}
