import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/string_exetension.dart';
import 'package:flowery_delivery/features/driver_orders/presentation/widgets/driver_order_state_widget.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_card_user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../../domain/entities/response/driver_order_entity.dart';

class DriverCardOrderDetails extends StatelessWidget {
  const DriverCardOrderDetails({
    super.key,
    required this.ordersList,

  });

  final DriverOrderList ordersList;


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
              context.translate(LangKeys.flowerOrder),
              style:
                  MyFonts.styleMedium500_14.copyWith(color: MyColors.blackBase),
            ),
            verticalSpacing(16.h),
            DriverOrderStateWidget(state: ordersList.order.state ,orderNumber: ordersList.order.orderNumber,),
            verticalSpacing(16.h),
            AutoSizeText(
              context.translate(LangKeys.pickupAddress),
              style: MyFonts.styleRegular400_16.copyWith(color: MyColors.gray),
            ),
            /// Store Card order
            CustomCardAddressDetails(
                title: ordersList.store.name,
                subtitle: ordersList.store.address,
                image: ordersList.store.image),
            verticalSpacing(16.h),
            AutoSizeText(
              context.translate(LangKeys.userAddress),
              style: MyFonts.styleRegular400_12.copyWith(color: MyColors.gray),
            ),
            /// User Address
            CustomCardAddressDetails(
                title:
                    '${ordersList.order.user.firstName} ${ordersList.order.user.lastName}',
                subtitle: ordersList.order.user.email,
                image: ordersList.order.user.photo.imageFormat()),
          ],
        ),
      ),
    );
  }
}
