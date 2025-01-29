import 'package:flowery_delivery/core/services/firebase_notification/notification_helper.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/utils/widgets/base/app_loader.dart';
import 'package:flowery_delivery/core/utils/widgets/buttons/carved_button.dart';
import 'package:flowery_delivery/core/utils/widgets/custom_appbar.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_actions.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_view_model_cubit.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/address_section.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/order_details_list.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/order_status_card.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/order_summary.dart';
import 'package:flowery_delivery/features/order_details/presentation/widgets/stepper_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
  });

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var orderViewModelCubit = context.read<OrderDetailsViewModelCubit>();

    return BlocBuilder<OrderDetailsViewModelCubit, OrderDetailsViewModelState>(
      builder: (context, state) {
        if (state is OrderDetailsViewModelLoading) {
          return Center(child: AppLoader());
        } else {
          final order = orderViewModelCubit.orderDetailsEntity!.orders;
          return Scaffold(
            appBar: customAppBar(
              appBarTxt: 'Order details',
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: StepperIndicator(
                          currentStep: orderViewModelCubit.orderStatus.step,
                          // Active step (zero-based index)
                          totalSteps: 5, // Total number of steps
                        ),
                      ),
                      OrderStatusCard(
                          status: order!.state ?? '',
                          orderId: order.orderNumber ?? '',
                          date: 'Wed, 03 Sep 2024, 11:00 AM'),
                      SizedBox(height: 20),
                      if (order.store != null)
                        AddressSection(
                          title: 'Pickup address',
                          name: order.store!.name ?? '',
                          address: order.store!.address ?? '',
                          image: order.store!.image ?? '',
                          phone: order.store!.phoneNumber ?? '',
                        ),
                      SizedBox(height: 16),
                      if (order.user != null)
                        AddressSection(
                          title: 'User address',
                          name:
                              '${order.user!.firstName ?? ''} ${order.user!.lastName ?? ''}',
                          address: order.user!.email ?? '',
                          image: order.user!.photo ?? '',
                          phone: order.user!.phone ?? '',
                        ),
                      SizedBox(height: 16),
                      if (order.orderItems != null)
                        OrderDetailsList(orderItems: order.orderItems!),
                      SizedBox(height: 16),
                      if (order.totalPrice != null && order.paymentType != null)
                        OrderSummary(
                            total: order.totalPrice!,
                            paymentMethod: order.paymentType!),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(8.0),
              child: CurvedButton(
                title: orderViewModelCubit.orderStatus.name,
                onTap: () async {
                  await orderViewModelCubit.updateOrderStatus(
                      orderViewModelCubit.orderDetailsEntity!);
                  await orderViewModelCubit.doAction(UpdateOrderStatus(
                      userId: order.user!.id!,
                      orderId: order.id!,
                      status: orderViewModelCubit.orderStatus.action));
                  await NotificationHelper().sendTopicNotification(
                    title: orderViewModelCubit.orderStatus.notificationTitle,
                    body: orderViewModelCubit.orderStatus.notificationBody,
                    topic: order.id,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
