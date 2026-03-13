import 'package:books_app/core/app_btn.dart'; // تأكد من المسار الصحيح للـ AppBtn
import 'package:books_app/core/theme/app_colors.dart'; // تأكد من مسار الألوان
import 'package:books_app/core/theme/app_text_style.dart'; // إذا كنت تستخدم ملف ستايل للنصوص
import 'package:books_app/features/auth/ui/login_screen.dart'; // الصفحة التي سيعود إليها المستخدم
import 'package:books_app/gen/translations/local_keys.g.dart'; // مفاتيح الترجمة
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء سادة حسب التصميم
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر عمودياً
            children: [
              const Spacer(), // يدفع العناصر لمنتصف الشاشة تقريباً

              // 1. علامة الصح الخضراء (Success Mark)
              // يفضل استخدام SvgPicture لو الصورة SVG، أو Image.asset لو PNG

              SvgPicture.asset(
                'assets/images/Successmark.svg', // تأكد أن المسار مكتوب صح في الـ pubspec.yaml
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(height: 35.h), // مسافة كبيرة حسب التصميم

              // 2. العنوان (Password Changed!)
              Text(
                LocaleKeys.password_changed_title.tr(), // تأكد من وجود هذا المفتاح في ملف الـ JSON
                style: TextStyle(
                  fontSize: 26.sp, // خط كبير وواضح
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E232C), // اللون الغامق الأساسي
                ),
              ),

              SizedBox(height: 10.h), // مسافة صغيرة

              // 3. النص الفرعي
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w), // لتقليل عرض النص قليلاً
                child: Text(
                  LocaleKeys.password_changed_message.tr(), // تأكد من المفتاح
                  textAlign: TextAlign.center, // توسيط النص
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF8391A1), // اللون الرمادي الفاتح
                    height: 1.5, // لزيادة المسافة بين السطور للقراءة
                  ),
                ),
              ),

              const Spacer(flex: 2), // مسافة أكبر قبل الزرار

              // 4. زرار "Back to Login"
              AppBtn(
                text: LocaleKeys.back_to_login.tr(),
                onTap: () {
                  // **هام جداً:** نستخدم pushAndRemoveUntil لمسح الـ History
                  // عشان المستخدم ميعرفش يرجع لصفحة "تغيير الباسورد" تاني
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (route) => false, // يمسح كل الطرق القديمة
                  );
                },
              ),

              SizedBox(height: 20.h), // مسافة أخيرة قبل نهاية الشاشة
            ],
          ),
        ),
      ),
    );
  }
}