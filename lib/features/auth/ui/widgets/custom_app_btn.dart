import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBtn extends StatelessWidget {
  final String text;
  final Image image;
  const CustomAppBtn({super.key, required this.text, required this.image,  });
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 19.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [image,SizedBox(width: 9.w),
          Text(text,textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.sp, color: Color(0xff6A707C)),),
        ],
      ),);
  }
}