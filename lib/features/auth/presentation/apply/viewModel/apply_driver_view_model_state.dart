part of 'apply_driver_view_model_cubit.dart';

@immutable
sealed class ApplyDriverViewModelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ApplyDriverViewModelInitial extends ApplyDriverViewModelState {}

final class ApplyDriverViewModelLoading extends ApplyDriverViewModelState {}

final class ApplyDriverViewModelError extends ApplyDriverViewModelState {
  final ErrorModel error;

  ApplyDriverViewModelError(this.error);

  @override
  List<Object?> get props => [error];
}

final class ApplyDriverViewModelSuccess extends ApplyDriverViewModelState {
  final ApplyResponseEntity _response;

  ApplyDriverViewModelSuccess(this._response);

  @override
  List<Object?> get props => [_response];
}
