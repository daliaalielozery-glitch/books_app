
import 'package:books_app/features/auth/ui/register_screen.dart';
import 'package:books_app/features/auth/ui/widgets/custom_app_btn.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_btn.dart';
import '../../../core/app_text_field.dart';
import '../../../../gen/translations/local_keys.g.dart';
import '../../../core/arrow_back.dart';
import '../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController= TextEditingController();
  var passwordController =TextEditingController();
  @override
  void dispose() {
emailController.dispose();
passwordController.dispose();
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

            AppTextField( controller: emailController
              ,hintText: LocaleKeys.email.tr(),
              keyboardType: TextInputType.emailAddress,
                ),

            SizedBox(height: 16.h),

            AppTextField(controller: passwordController,
              hintText: LocaleKeys.password.tr(),
              keyboardType: TextInputType.visiblePassword,

              isPassword: true,
            ),

            SizedBox(height: 30.h),

            AppBtn(text: LocaleKeys.login.tr(),
              onTap: ()async{
              await login()
              ;},),

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
                Expanded(child: SizedBox(width: 108.w, child: Text("or".tr())),),
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


login()async{
    //first I take object dio with the constractor frome <<<package Dio>>>
  //then  send a request ((((type post))));
  //i store the response in the variable response
  Dio dio =Dio();
final response = await dio.post("https://codingarabic.online/api/login",
data: {
  "email":emailController.text,
  "password":passwordController.text
});
debugPrint(response.data["data"]["user"]["name"]);

}
}
//todo I want to put the safe area