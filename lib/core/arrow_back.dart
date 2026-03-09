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
            decoration: BoxDecoration(
              border: Border.all(
                // border thickness
              ),
              borderRadius: BorderRadius.circular(8), // optional rounded corners
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black, // icon color
              // icon size
            ),
          ),
        ),
      ],
    );
  }
}
