import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_btn.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_field.dart';
import '../../../../gen/translations/local_keys.g.dart';
import '../../../core/arrow_back.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBack(),
            SizedBox(height: 80.h),

            Text(
              LocaleKeys.registertxt.tr(),
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40.h),

             AppTextField(
              hintText: LocaleKeys.username.tr(),
              icon: Icons.person,
            ),

            SizedBox(height: 16.h),

            AppTextField(
              hintText: LocaleKeys.email.tr(),
              icon: Icons.email,
            ),

            SizedBox(height: 16.h),

             AppTextField(
              hintText: LocaleKeys.password.tr(),
              icon: Icons.lock,
              isPassword: true,
            ),

            SizedBox(height: 16.h),

             AppTextField(
              hintText: LocaleKeys.confirm_password.tr(),
              icon: Icons.lock,
              isPassword: true,
            ),

            SizedBox(height: 30.h),

            AppBtn(text: LocaleKeys.register.tr(),),

            SizedBox(height: 20.h),

            Center(
              child:  Text.rich(TextSpan(text:LocaleKeys.already_have_account.tr(),
                  children: [TextSpan(text:LocaleKeys.login_now.tr(),style:
              TextStyle(fontWeight: FontWeight.bold,color: AppColors.primaryColor),recognizer: TapGestureRecognizer()
                    ..onTap = () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },)]),

                style: TextStyle(fontSize: 14.sp),
              ),

            )
          ],
        ),
      ),
    );
  }
}