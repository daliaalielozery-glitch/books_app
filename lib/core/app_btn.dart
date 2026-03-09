import 'package:books_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBtn extends StatelessWidget {
  final Color? backgroundColor;
  final String text;
  final VoidCallback? onTap;
  const AppBtn({super.key,  this.backgroundColor, required this.text,  this.onTap, });
  @override
  Widget build(BuildContext context) {
    return InkWell( onTap: onTap,
      child: Container(width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 19.h),
        decoration: BoxDecoration(color:backgroundColor??AppColors.primaryColor,border:backgroundColor==null?null: Border.all(),
            borderRadius: BorderRadius.circular(8.r)),
        child: Text(text,textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp,color:backgroundColor==Colors.white?Colors.black:Colors.white  ),),),
    );
  }
}
