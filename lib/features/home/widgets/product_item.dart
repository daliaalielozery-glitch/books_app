import 'package:books_app/core/theme/app_colors.dart';
import 'package:books_app/core/widgets/custom_network_image.dart';
import 'package:books_app/features/home/data/models/best_seller_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final Product? product;
  const ProductItem({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: 160.w,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.productColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CustomNetworkImage(
              width: 140.w,
              height: 180.h,
              imageUrl:
                 product?.image??"",
            ),
          ),
          SizedBox(height: 10.h),

          Expanded(
            child: Text(product?.name??"", style: TextStyle(fontSize: 12.sp)),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Text(product?.price??"", style: TextStyle(fontSize: 15.sp)),
              ),
              SizedBox(width: 8.w),
              Container(
                height: 40.h,
                width: 60.w,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(
                      color: AppColors.whitetxt,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
