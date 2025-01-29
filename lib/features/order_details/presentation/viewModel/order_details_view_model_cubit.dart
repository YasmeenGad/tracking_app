import 'package:bloc/bloc.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flowery_delivery/core/networking/error/error_model.dart';
import 'package:flowery_delivery/core/services/firebase_helper/fire_store_ref_key.dart';
import 'package:flowery_delivery/core/services/firebase_notification/notification_helper.dart';
import 'package:flowery_delivery/features/order_details/data/mappers/order_details_mapper.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:flowery_delivery/features/order_details/domain/use_cases/add_order_details_case.dart';
import 'package:flowery_delivery/features/order_details/domain/use_cases/get_order_by_order_id_case.dart';
import 'package:flowery_delivery/features/order_details/domain/use_cases/update_order_status.dart';
import 'package:flutter/cupertino.dart';
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
  var orderStatus = (
    step: 1,
    name: "Arrived at Pickup Point",
    action:FireStoreRefKey.accepted,
  );
  OrderDetailsEntity? orderDetailsEntity;

  Future<void> doAction(OrderDetailsActions action) async {
    switch (action) {
      case AddOrderDetails():
        await _addOrderDetails(action);

      case GetOrderDetails():
        await _getOrderDetails(action);
      case UpdateOrderStatus():
        _updateOrderStatus(action);
    }
  }

  Future<void> _addOrderDetails(AddOrderDetails action) async {
    emit(OrderDetailsViewModelLoading());

    final result = await addOrderDetailsCase(
        orderDetails: OrderDetailsEntity(
            driver: action.driver,
            orders: OrderDetailsMapper.toOrderData(action.order)));
    switch (result) {
      case Success<void>():
        NotificationHelper().sendTopicNotification(
          title: 'Order Accepted',
          body: 'Your order has been accepted by the store',
          topic: action.order.id,
        );
        emit(AddOrderSuccess());

      case Fail<void>():
        emit(
            OrderDetailsViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _getOrderDetails(GetOrderDetails action) async {
    emit(OrderDetailsViewModelLoading());
    final resultStream = await getOrderByOrderIdCase(
        orderId: action.orderId, userId: action.userId);
    resultStream.listen((result) {
      switch (result) {
        case Success<OrderDetailsEntity>():
          orderDetailsEntity = result.data;
          debugPrint(' order details ${result.data.orders}');
          emit(GetOrderDetailsSuccess(result.data));
        case Fail<OrderDetailsEntity>():
          emit(OrderDetailsViewModelError(ErrorHandler.handle(result.exception!)));
      }
    });
  }

  Future<void> _updateOrderStatus(UpdateOrderStatus action) async {
    emit(OrderDetailsViewModelLoading());
    final result = await updateOrderStatusCase(
        userId: action.userId, orderId: action.orderId, status: action.status);
    switch (result) {
      case Success<void>():
        debugPrint(' order status updated ${action.status}');

        emit(UpdateOrderStatusSuccess());
      case Fail<void>():
        emit(
            OrderDetailsViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }

  updateOrderStatus(OrderDetailsEntity orderDetailsEntity) {

    switch (orderDetailsEntity.orders!.state!) {
      // case FireStoreRefKey.pending:
      //   debugPrint(' order status name ${orderStatus.name}');
      //
      //   return orderStatus = (
      //     step: 1,
      //     name: "Arrived at Pickup Point",
      //     action:FireStoreRefKey.accepted,
      //   );
      case FireStoreRefKey.accepted:
        debugPrint(' order status name ${orderStatus.name}');
         orderStatus = (
          step: 2,
          name: "Start Delivery",
          action: FireStoreRefKey.picked,
        );

      case FireStoreRefKey.picked:
         orderStatus = (
          step: 3,
          name: "Arrived to The User",
          action: FireStoreRefKey.outForDelivery,
        );

      case FireStoreRefKey.outForDelivery:
         orderStatus = (
          step: 4,
          name: "Arrived at The Destination",
          action:FireStoreRefKey.arrived,
        );
      case FireStoreRefKey.arrived:
         orderStatus = (
          step: 5,
          name: "Delivered",
          action: FireStoreRefKey.delivered,
        );
    }

emit( UpdateStatus());
  }
}

enum OrderStatus { accepted, picked, outForDelivery, arrived, delivered }
