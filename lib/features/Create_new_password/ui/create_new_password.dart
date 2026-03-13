import 'package:books_app/core/app_btn.dart';
import 'package:books_app/core/app_text_field.dart';
import 'package:books_app/core/arrow_back.dart';
import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/features/auth/ui/login_screen.dart';
import 'package:books_app/features/password_changed/ui/password_changed_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/translations/local_keys.g.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

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
              LocaleKeys.create_new_password.tr(),
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              LocaleKeys.new_password_message.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.darkgrey,
                height: 1.5,
              ),
            ),

            SizedBox(height: 30.h,),

            AppTextField(hintText: LocaleKeys.new_password.tr()),
            SizedBox(height: 15.h,),
            AppTextField(hintText: LocaleKeys.confirm_password.tr()),
            SizedBox(height: 38.h,),
            AppBtn(text: LocaleKeys.reset_password.tr(),onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasswordChangedScreen(),
                ),
              );
            },),

          ],
        ),
      ),
    );
  }
}