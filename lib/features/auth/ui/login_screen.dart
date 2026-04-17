import 'package:books_app/features/auth/ui/register_screen.dart';
import 'package:books_app/features/auth/ui/widgets/custom_app_btn.dart';
import 'package:books_app/features/buttom_nav_bar/ui/buttom_nav_bar_screen.dart';
import 'package:books_app/features/forget_password/ui/forget_password_screen.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/app_btn.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../../gen/translations/local_keys.g.dart';
import '../../../core/widgets/arrow_back.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArrowBack(onTap: () => Navigator.pop(context)),
                  SizedBox(height: 60.h),

                  Text(
                    LocaleKeys.logintxt.tr(),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 40.h),

                  AppTextField(
                    controller: emailController,
                    hintText: LocaleKeys.email.tr(),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 16.h),

                  AppTextField(
                    controller: passwordController,
                    hintText: LocaleKeys.password.tr(),
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),

                  SizedBox(height: 13.h),

                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        LocaleKeys.forgot_password.tr(),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  Builder(
                    builder: (context) {
                      return BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthLoadingState) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) =>
                                  const Center(child: CircularProgressIndicator()),
                            );
                          } else if (state is AuthErrorState) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    title: Text("error"),
                                    content: Text(
                                      "Something went wrong please try again",
                                    ),
                                  ),
                            );
                          }else if (state is AuthSuccessState) {

                            Navigator.of(context).pop();

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ButtomNavBarScreen(),
                              ),
                                  (route) => false,
                            );

                          }
                        },
                        child: AppBtn(
                          text: LocaleKeys.login.tr(),
                          onTap: () {
                            context.read<AuthCubit>().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                        ),
                      );
                    }
                  ),

                  SizedBox(height: 35.h),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.h,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          LocaleKeys.or.tr(),
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.h,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 35.h),

                  CustomAppBtn(
                    text: LocaleKeys.sign_in_with_google.tr(),
                    image: Image.asset("assets/images/google.png"),
                  ),
                  SizedBox(height: 12.h),
                  CustomAppBtn(
                    text: LocaleKeys.sign_in_with_apple.tr(),
                    image: Image.asset("assets/images/apple.png"),
                  ),

                  SizedBox(height: 30.h),

                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: LocaleKeys.dont_have_account.tr(),
                        style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: " ${LocaleKeys.register_now.tr()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    try {
      Dio dio = Dio();
      final response = await dio.post(
        "https://codingarabic.online/api/login",
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      debugPrint(response.data["data"]["user"]["name"]);
    } catch (e) {
      debugPrint("Login Error: $e");

    }
  }
}
