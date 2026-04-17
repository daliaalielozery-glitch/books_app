import 'package:books_app/features/home/cubit/home_cubit.dart';
import 'package:books_app/features/home/widgets/home_app_bar.dart';
import 'package:books_app/features/home/widgets/home_slider.dart';
import 'package:books_app/features/home/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(),
        SizedBox(height: 15.h),
        HomeSlider(),
        SizedBox(height: 15.h),
        Text(
          "Best Seller",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15.h),
        
        // تصحيح الـ BlocBuilder هنا
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is BestSellerLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BestSellerSuccessState) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 11.w,
                    mainAxisSpacing: 15.h,
                    mainAxisExtent: 300.h,
                  ),
                  itemCount: state.products.length, 
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: state.products[index],
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ],
    );
  }
}