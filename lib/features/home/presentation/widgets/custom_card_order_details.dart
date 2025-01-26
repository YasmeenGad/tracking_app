import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/core/services/firebase_notification/notification_helper.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_card_user_details.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_status_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../domain/entities/response/pending_order_response_entity.dart';

class CustomCardOrderDetails extends StatefulWidget {
  const CustomCardOrderDetails({
    super.key,
    required this.order, required this.onRejectPressed,
  });

  final PendingOrderResponseEntityOrders order;
  final VoidCallback onRejectPressed;

  @override
  State<CustomCardOrderDetails> createState() => _CustomCardOrderDetailsState();
}

class _CustomCardOrderDetailsState extends State<CustomCardOrderDetails> {
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
                title: widget.order.store?.name ?? '',
                subtitle: widget.order.store?.address ?? '',
                image: widget.order.store?.image ?? ''),
            verticalSpacing(16.h),
            AutoSizeText(
              "Delivery Address",
              style: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
            ),
            CustomCardUserDetails(
                title:
                    '${widget.order.user?.firstName ?? ''} ${widget.order.user?.lastName ?? ''}',
                subtitle: widget.order.user?.email ?? '',
                image: widget.order.user?.photo ?? ''),
            verticalSpacing(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText("EGP ${widget.order.totalPrice.toString()}",
                    style: MyFonts.styleSemiBold600_14
                        .copyWith(color: MyColors.blackBase)),
                CustomStatusButton(statusTxt: 'Reject',  onPressed:() => widget.onRejectPressed,),
                CustomStatusButton(
                  statusTxt: 'Accept',
                  borderClr: Colors.transparent,
                  textColor: MyColors.white,
                  containerClr: MyColors.baseColor,onPressed: () {
                    NotificationHelper().sendTopicNotification(
                      title: 'Order Accepted',
                      body: 'Your order has been accepted by the store',
                      topic: widget.order.id,
                    );
                },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
