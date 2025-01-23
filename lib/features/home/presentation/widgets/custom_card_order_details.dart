import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_card_user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../../../generated/assets.dart';

class CustomCardOrderDetails extends StatelessWidget {
  const CustomCardOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Flower Order",
              style:
                  MyFonts.styleMedium500_14.copyWith(color: MyColors.blackBase),
            ),
            verticalSpacing(16.h),
            AutoSizeText(
              "Pickup Address",
              style: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
            ),
            CustomCardUserDetails(
                title: 'Flowery Store',
                subtitle: '20th st, Sheikh Zayed, Giza',
                image: Assets.imagesFloweryLogo),
            verticalSpacing(16.h),
            AutoSizeText(
              "Delivery Address",
              style: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
            ),
            CustomCardUserDetails(
                title: 'Nour mohamed',
                subtitle: '20th st, Sheikh Zayed, Giza',
                image: Assets.imagesImageProfile),
          ],
        ),
      ),
    );
  }
}
