import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const AppTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType, this.controller,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscuer=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      obscureText: widget.isPassword&&isObscuer,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyle().hintstyle,
        suffixIcon: widget.isPassword
            ? Padding(
          padding: EdgeInsetsGeometry.all(8.0.r),
          child: InkWell(
            onTap: () {
              setState(() {
                isObscuer = !isObscuer;
              });
            },
            child: isObscuer
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child:const Icon(Icons.visibility_off) ,
            )
                :SvgPicture.asset(Assets.images.eyeIcon) ,
          ),
        )
            : null,
        filled: true,
        fillColor: AppColors.greyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// toDo i will do this task
