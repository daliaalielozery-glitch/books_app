import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/features/home/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeindex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is SliderLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        else if (state is SliderSuccessState) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.h,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeindex = index;
                    });
                  },
                  viewportFraction: 1,
                ),
                items: state.sliders.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          i.image ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          // Error builder in case the URL is broken
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 14.h),
              AnimatedSmoothIndicator(
                activeIndex: activeindex,
                count: state.sliders.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10.h,
                  dotWidth: 10.w,
                  activeDotColor: AppColors.primaryColor,
                ),
              ),
            ],
          );
        }

        else {
          return const Center(child: Text("No data available"));
        }
      },
    );
  }
}