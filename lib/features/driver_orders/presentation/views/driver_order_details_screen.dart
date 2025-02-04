import 'package:flowery_delivery/core/localization/lang_keys.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/string_exetension.dart';
import 'package:flowery_delivery/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_delivery/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/features/driver_orders/domain/entities/response/driver_order_entity.dart';
import 'package:flowery_delivery/features/driver_orders/presentation/widgets/driver_order_details_list.dart';
import 'package:flowery_delivery/features/driver_orders/presentation/widgets/driver_order_state_widget.dart';
import 'package:flowery_delivery/features/driver_orders/presentation/widgets/driver_order_summary.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_view_model_cubit.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/address_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverOrderDetailsScreen extends StatefulWidget {
  final DriverOrderList order;

  const DriverOrderDetailsScreen({
    super.key, required this.order,
  });

  @override
  State<DriverOrderDetailsScreen> createState() => _DriverOrderDetailsScreenState();
}

class _DriverOrderDetailsScreenState extends State<DriverOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<OrderDetailsViewModelCubit>();

    return BlocBuilder<OrderDetailsViewModelCubit, OrderDetailsViewModelState>(
      builder: (context, state) {
        if (state is OrderDetailsViewModelLoading) {
          return Center(child: AppLoader());
        } else {
          return Scaffold(
            appBar: customAppBar(
              appBarTxt: context.translate(LangKeys.orderDetails),
              context: context,
              showArrow: true,
            ),
            backgroundColor: MyColors.white,
            body: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(16.h),
                      DriverOrderStateWidget(state: widget.order.order.state ,orderNumber: widget.order.order.orderNumber,),
                      verticalSpacing(16.h),
                     
                      AddressSection(
                        title: context.translate(LangKeys.pickupAddress),
                        name: widget.order.store.name,
                        address: widget.order.store.address,
                        image: widget.order.store.image,
                        phone: widget.order.store.phoneNumber,
                      ),
                      verticalSpacing(16.h),
                      AddressSection(
                        title: context.translate(LangKeys.userAddress) ,
                        name:
                            '${widget.order.order.user.firstName} ${widget.order.order.user.lastName}',
                        address: widget.order.order.user.email,
                        image: widget.order.order.user.photo.imageFormat(),
                        phone: widget.order.order.user.phone,
                      ),
                      verticalSpacing(16.h),
                      DriverOrderDetailsList(orderItems: widget.order.order.orderItems),
                      verticalSpacing(16.h),
                      DriverOrderSummary(
                          total: widget.order.order.totalPrice.toInt(),
                          paymentMethod: widget.order.order.paymentType),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
