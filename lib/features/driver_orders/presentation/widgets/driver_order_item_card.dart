import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/features/driver_orders/domain/entities/response/driver_order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DriverOrderItemCard extends StatelessWidget {
 final OrderItemEntity order;
  const DriverOrderItemCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: MyColors.whiteBase,
        borderOnForeground: true,
        elevation: 4.sp,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading:  ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: '',
            width: 44.w,
            height: 44.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
              child: SpinKitWave(
                color: MyColors.baseColor,
                size: 30.w,
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              size: 44.w,
              color: MyColors.gray,
            ),
          ),
        ),
        title: Text('', style: MyFonts.styleRegular400_13.copyWith(color: MyColors.grey)),
        subtitle: Text('EGP ${order.product.price}', style: MyFonts.styleMedium500_13.copyWith(color: MyColors.blackBase)),
        trailing: Text('X${ order.quantity}', style: MyFonts.styleMedium500_13.copyWith(color: MyColors.baseColor)),
      ),
    );
  }
}