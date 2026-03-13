import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_btn.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../core/app_text_field.dart';
import '../../../../gen/translations/local_keys.g.dart';
import '../../../core/arrow_back.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var enteremailController= TextEditingController();
  var enterpasswordController =TextEditingController();
  var confirmPasswordController =TextEditingController();
  var userNameController =TextEditingController();
  @override
  void dispose() {
enterpasswordController.dispose();
enterpasswordController.dispose();
userNameController.dispose();
confirmPasswordController.dispose();
super.dispose();
  }
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
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40.h),

            AppTextField(controller: userNameController,
              hintText: LocaleKeys.username.tr(),),

            SizedBox(height: 16.h),

            AppTextField(controller: enteremailController,
                hintText: LocaleKeys.email.tr(),keyboardType: TextInputType.emailAddress),

            SizedBox(height: 16.h),

            AppTextField(controller: enterpasswordController,
                hintText: LocaleKeys.password.tr(),keyboardType: TextInputType.visiblePassword, isPassword: true),

            SizedBox(height: 16.h),

            AppTextField(controller: confirmPasswordController,
              hintText: LocaleKeys.confirm_password.tr(),

              isPassword: true,
            ),

            SizedBox(height: 30.h),

            AppBtn(
                text: LocaleKeys.register.tr(),onTap: ()async{
              await register()
              ;}),

            SizedBox(height: 20.h),

            Center(
              child: Text.rich(
                TextSpan(
                  text: LocaleKeys.already_have_account.tr(),
                  children: [
                    TextSpan(
                      text: LocaleKeys.login_now.tr(),
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
          ],
        ),
      ),
    );
  }
  register() async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        "https://codingarabic.online/api/register",
        data: {
          "name": userNameController.text, // ضيفي .text
          "email": enteremailController.text,
          "password": enterpasswordController.text,
          "password_confirmation": confirmPasswordController.text // ضيفي .text
        },
      );
      debugPrint(response.data["data"]["user"]["name"]);
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }

}

//todo iwant to put the safe area
