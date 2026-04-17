import 'package:books_app/core/widgets/app_btn.dart';
import 'package:books_app/core/widgets/app_text_field.dart';
import 'package:books_app/core/widgets/arrow_back.dart';
import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/features/OTP_verification/ui/otp_verification_screen.dart';
import 'package:books_app/features/auth/ui/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/translations/local_keys.g.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBack(),

            SizedBox(height: 30.h),

            Text(
              LocaleKeys.forgot_password.tr(),
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              LocaleKeys.forgot_password_message.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.darkgrey,
                height: 1.5,
              ),
            ),

            SizedBox(height: 30.h,),
            
            AppTextField(hintText: LocaleKeys.enter_email.tr()),
            SizedBox(height: 38.h,),
            AppBtn(text: LocaleKeys.send_code.tr(),onTap: (){ Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtpVerificationScreen(),
              ),
            );},),
            Spacer(),
            Align(  alignment: Alignment.bottomCenter,
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: LocaleKeys.remember_password.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys.login.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
              
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}