part of 'order_details_view_model_cubit.dart';

sealed class OrderDetailsViewModelState {}

final class OrderDetailsViewModelInitial extends OrderDetailsViewModelState {}

final class OrderDetailsViewModelLoading extends OrderDetailsViewModelState {}

final class AddOrderSuccess extends OrderDetailsViewModelState {

}

final class OrderDetailsViewModelError extends OrderDetailsViewModelState {
  final ErrorModel errorModel;

  OrderDetailsViewModelError(this.errorModel);
}

final class GetOrderDetailsSuccess extends OrderDetailsViewModelState {
  final OrderDetailsEntity orderDetailsEntity;

  GetOrderDetailsSuccess(this.orderDetailsEntity);
}

final class UpdateOrderStatusSuccess extends OrderDetailsViewModelState {
  // final OrderDetailsEntity orderDetailsEntity;
  //
  // UpdateOrderStatusSuccess(this.orderDetailsEntity);
}

final class UpdateStatus extends OrderDetailsViewModelState {

}

