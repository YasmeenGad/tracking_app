import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.baseColor,
        borderRadius: BorderRadius.circular(48),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 30.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.white,
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: MyColors.baseColor,
              size: 20,
            ),
          ),
          Text(
            "Your Location",
            style: MyFonts.styleRegular400_12.copyWith(color: MyColors.white),
          ),
        ],
      ),
    );
  }
}
