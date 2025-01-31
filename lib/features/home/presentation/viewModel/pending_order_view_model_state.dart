part of 'pending_order_view_model_cubit.dart';

sealed class PendingOrderViewModelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PendingOrderViewModelInitial extends PendingOrderViewModelState {
  @override
  List<Object?> get props => [];
}

final class PendingOrderViewModelLoading extends PendingOrderViewModelState {
  @override
  List<Object?> get props => [];
}

final class PendingOrderViewModelLoaded extends PendingOrderViewModelState {
  final PendingOrderResponseEntity response;

  PendingOrderViewModelLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

final class PendingOrderViewModelError extends PendingOrderViewModelState {
  final ErrorModel errorMessage;

  PendingOrderViewModelError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
