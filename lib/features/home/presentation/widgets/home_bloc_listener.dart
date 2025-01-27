import 'package:flowery_delivery/core/routes/app_routes.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import 'package:flowery_delivery/di/di.dart';
import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_actions.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class HomeBlocListener extends StatelessWidget {
  final PendingOrderResponseEntityOrders order;
  const HomeBlocListener({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderDetailsViewModelCubit, OrderDetailsViewModelState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          getIt.get<OrderDetailsViewModelCubit>().doAction(
              UpdateOrderStatus(
                orderId: order.id!,
                userId: order.user!.id!,
                status: 'Accepted',
              ));

        } else if (state is  UpdateOrderStatusSuccess) {
          getIt.get<OrderDetailsViewModelCubit>().doAction(
              GetOrderDetails(
                orderId: order.id!,
                userId: order.user!.id!,
              ));
        } else if (state is GetOrderDetailsSuccess) {
          context.pushNamed(AppRoutes.orderDetailsView, arguments: order);
        } else if (state is AcceptOrderSuccess) {
        }else if (state is OrderDetailsViewModelError) {

        }
      },
      child: SizedBox(),
    );
  }
}
