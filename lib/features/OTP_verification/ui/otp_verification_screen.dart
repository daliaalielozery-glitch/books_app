import 'package:books_app/core/app_btn.dart';
import 'package:books_app/core/app_text_field.dart';
import 'package:books_app/core/arrow_back.dart';
import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/features/Create_new_password/ui/create_new_password.dart';
import 'package:books_app/features/OTP_verification/ui/widgets/otp_txt_field.dart';
import 'package:books_app/features/auth/ui/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/translations/local_keys.g.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBack(),

            SizedBox(height: 28.h),

            Text(
              LocaleKeys.otp_verification.tr(),
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              LocaleKeys.otp_message.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.darkgrey,
                height: 1.5,
              ),
            ),

            SizedBox(height: 30.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
                OtpTextField(),
              ],
            ),
            SizedBox(height: 38.h,),
            AppBtn(
              text: LocaleKeys.verify.tr(),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateNewPassword(),
                  ),
                );
              },
            ),          Spacer(),
            Align(  alignment: Alignment.bottomCenter,
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: LocaleKeys.didnt_receive_code.tr(),
                    children: [
                      TextSpan(
                        text: LocaleKeys.resend.tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),

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