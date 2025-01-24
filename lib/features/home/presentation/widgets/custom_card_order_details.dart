import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_card_user_details.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_status_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../domain/entities/response/pending_order_response_entity.dart';

class CustomCardOrderDetails extends StatelessWidget {
  const CustomCardOrderDetails({
    super.key,
    required this.order,
  });

  final PendingOrderResponseEntityOrders order;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(15),
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
                title: order.store?.name ?? '',
                subtitle: order.store?.address ?? '',
                image: order.store?.image ?? ''),
            verticalSpacing(16.h),
            AutoSizeText(
              "Delivery Address",
              style: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
            ),
            CustomCardUserDetails(
                title:
                    '${order.user?.firstName ?? ''} ${order.user?.lastName ?? ''}',
                subtitle: order.user?.email ?? '',
                image: order.user?.photo ?? ''),
            verticalSpacing(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText("EGP ${order.totalPrice.toString()}",
                    style: MyFonts.styleSemiBold600_14
                        .copyWith(color: MyColors.blackBase)),
                CustomStatusButton(statusTxt: 'Reject'),
                CustomStatusButton(
                  statusTxt: 'Accept',
                  borderClr: Colors.transparent,
                  textColor: MyColors.white,
                  containerClr: MyColors.baseColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
