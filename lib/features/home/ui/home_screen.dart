import 'package:books_app/features/home/widgets/home_app_bar.dart';
import 'package:books_app/features/home/widgets/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [HomeAppBar(),SizedBox(height: 15.h,),
      HomeSlider()]);
  }
}
