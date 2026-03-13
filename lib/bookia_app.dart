import 'package:books_app/features/Create_new_password/ui/create_new_password.dart';
import 'package:books_app/features/OTP_verification/ui/otp_verification_screen.dart';
import 'package:books_app/features/auth/ui/login_screen.dart';
import 'package:books_app/features/auth/ui/register_screen.dart';
import 'package:books_app/features/forget_password/ui/forget_password_screen.dart';
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
        home: WelcomeScreen(),
      ),
    );
  }
}
