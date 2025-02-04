part of 'driver_order_view_model_cubit.dart';

sealed class DriverOrderViewModelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DriverOrderViewModelInitial extends DriverOrderViewModelState {
  @override
  List<Object?> get props => [];
}

final class DriverOrderViewModelLoading extends DriverOrderViewModelState {
  @override
  List<Object?> get props => [];
}

final class DriverOrderViewModelLoaded extends DriverOrderViewModelState {
  final DriverOrderEntity response;

  DriverOrderViewModelLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

final class DriverOrderViewModelError extends DriverOrderViewModelState {
  final ErrorModel errorMessage;

  DriverOrderViewModelError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
