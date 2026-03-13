import 'package:books_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  final void Function()? onTap;
  const ArrowBack({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(

          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8), // space between icon and border
            decoration: BoxDecoration(color: AppColors.whitetxt,
              border: Border.all(color: AppColors.borderColor
                // border thickness
              ),
              borderRadius: BorderRadius.circular(12), // optional rounded corners
            ),
            child: Align(alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black, // icon color
                // icon size
              ),
            ),
          ),
        ),
      ],
    );
  }
}
