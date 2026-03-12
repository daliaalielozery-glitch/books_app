import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_btn.dart';
import '../../gen/assets.gen.dart';
import '../../gen/translations/local_keys.g.dart';
import '../auth/ui/login_screen.dart';
import '../auth/ui/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.symmetric(horizontal: 22.h),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.welcomeBackground.image().image, // <-- correct
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30.h),Row(
            children: [
              IconButton(onPressed: (){
                if(context.locale.languageCode=="ar"){
                  context.setLocale(Locale("en"));
                }else{context.setLocale(Locale("ar"));}
              }, icon: Icon(Icons.language)),
            ],
          ), // optional spacing

            SizedBox(height: 90.h), // optional spacing
            Assets.images.splash.image(),
            SizedBox(height: 28.h), // optional spacing

            Expanded(child: Text(LocaleKeys.orderNow.tr(),style: TextStyle(fontFamily: "DM"),)),
            AppBtn(
              text: LocaleKeys.login.tr(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),

            SizedBox(height: 5.h),

            AppBtn(text: LocaleKeys.register.tr(),backgroundColor: Colors.white, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
              ); },),
            SizedBox(height: 94.h,)
          ],
       ),
       ),
    );
  }
}
// todo iwant to put the safe area
// dart run easy_localization:generate -S assets/translations -O lib/gen/translations -o locale_keys.g.dart -f keys