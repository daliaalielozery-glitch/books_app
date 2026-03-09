
import 'package:books_app/features/auth/ui/register_screen.dart';
import 'package:books_app/features/auth/ui/widgets/custom_app_btn.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_btn.dart';
import '../../../../core/theme/app_text_field.dart';
import '../../../../gen/translations/local_keys.g.dart';
import '../../../core/arrow_back.dart';
import '../../../core/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBack(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 80.h),

            Text(
              LocaleKeys.logintxt.tr(),
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40.h),

            AppTextField(hintText: LocaleKeys.email.tr(), icon: Icons.email),

            SizedBox(height: 16.h),

            AppTextField(
              hintText: LocaleKeys.password.tr(),
              icon: Icons.lock,
              isPassword: true,
            ),

            SizedBox(height: 30.h),

            AppBtn(text: LocaleKeys.login.tr()),

            SizedBox(height: 20.h),

            Center(
              child: Text.rich(
                TextSpan(
                  text: LocaleKeys.dont_have_account.tr(),
                  children: [
                    TextSpan(
                      text: LocaleKeys.register_now.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),

                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(thickness: 2.h)),
                Expanded(child: Text("or".tr()),),
                Expanded(child: Divider(thickness: 2.h)),
              ],
            ),
            CustomAppBtn(text: LocaleKeys.sign_in_with_google.tr(), image: Image.asset("assets/images/google.png")),
            CustomAppBtn(text: LocaleKeys.sign_in_with_apple.tr(), image: Image.asset("assets/images/apple.png"))
          ],
        ),
      ),
    );
  }
}
