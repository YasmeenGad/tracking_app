import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocListener extends StatelessWidget {
  final PendingOrderResponseEntityOrders order;
  const HomeBlocListener({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderDetailsViewModelCubit, OrderDetailsViewModelState>(
      listener: (context, state) async {
        if (state is AddOrderSuccess) {


        } else if (state is  UpdateOrderStatusSuccess) {

        } else if (state is GetOrderDetailsSuccess) {
        } else if (state is UpdateStatus) {
        }else if (state is OrderDetailsViewModelError) {

        }
      },
      child: SizedBox(),
    );
  }
}
