import 'package:books_app/core/helper/app_constants.dart';
import 'package:books_app/features/buttom_nav_bar/ui/buttom_nav_bar_screen.dart';
import 'package:books_app/features/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,theme: ThemeData(fontFamily: "DM",scaffoldBackgroundColor: Colors.white

      ),
        home: startScreen(),
      ),
    );
  }
  Widget startScreen() {
    final token = AppConstants.token;

    if (token == null || token.isEmpty) {
      return const WelcomeScreen();
    } else {
      return const ButtomNavBarScreen();
    }
  }
    }



