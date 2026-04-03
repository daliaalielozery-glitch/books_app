import 'package:books_app/core/theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeindex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            onPageChanged: (index,r){setState(() {
              activeindex=index;
            });},
            viewportFraction: 1,
          ),

          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                  child: Image.network(
                    "http://127.0.0.1:8000/front/assets/images/carousel-3.png",
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 14.h),
        AnimatedSmoothIndicator(
          activeIndex: activeindex,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 17.h,
            dotWidth: 17.w,
            activeDotColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
