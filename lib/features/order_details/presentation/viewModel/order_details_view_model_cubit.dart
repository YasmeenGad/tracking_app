import 'package:bloc/bloc.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flowery_delivery/core/networking/error/error_model.dart';
import 'package:flowery_delivery/features/order_details/data/mappers/order_details_mapper.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:flowery_delivery/features/order_details/domain/use_cases/add_order_details_case.dart';
import 'package:flowery_delivery/features/order_details/domain/use_cases/get_order_by_order_id_case.dart';
import 'package:flowery_delivery/features/order_details/domain/use_cases/update_order_status.dart';
import 'package:injectable/injectable.dart';

import 'order_details_actions.dart';

part 'order_details_view_model_state.dart';

@injectable
class OrderDetailsViewModelCubit extends Cubit<OrderDetailsViewModelState> {
  final AddOrderDetailsCase addOrderDetailsCase;
  final GetOrderByOrderIdCase getOrderByOrderIdCase;

  final UpdateOrderStatusCase updateOrderStatusCase;

  OrderDetailsViewModelCubit(this.addOrderDetailsCase,
      this.getOrderByOrderIdCase, this.updateOrderStatusCase)
      : super(OrderDetailsViewModelInitial());

  doAction(OrderDetailsActions action) {
    switch (action) {
      case AddOrderDetails():
        _addOrderDetails(action);

      case GetOrderDetails():
        _getOrderDetails(action);
      case UpdateOrderStatus():
        _updateOrderStatus(action);
    }
  }

  Future<void> _addOrderDetails(AddOrderDetails action) async {
    emit(OrderDetailsViewModelLoading());

    final result = await addOrderDetailsCase(orderDetails: OrderDetailsEntity(
        driver: action.driver, orders:OrderDetailsMapper.toOrderData( action.order)
    ));
    switch (result) {
      case Success<void>():
        emit(AddOrderSuccess());
      case Fail<void>():
        emit(
            OrderDetailsViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }
  Future<void> _getOrderDetails(GetOrderDetails action) async {
    emit(OrderDetailsViewModelLoading());
    final result = await getOrderByOrderIdCase(
        orderId: action.orderId, userId: action.userId);
    switch (result) {
      case Success<OrderDetailsEntity>():
        emit(GetOrderDetailsSuccess(result.data));
      case Fail<OrderDetailsEntity>():
        emit(
            OrderDetailsViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _updateOrderStatus(UpdateOrderStatus action) async {
    emit(OrderDetailsViewModelLoading());
    final result = await updateOrderStatusCase(
        userId: action.userId,
        orderId: action.orderId,
        status: action.status);
    switch (result) {
      case Success<OrderDetailsEntity>():
        emit(UpdateOrderStatusSuccess(result.data));
      case Fail<OrderDetailsEntity>():
        emit(
            OrderDetailsViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }
}
