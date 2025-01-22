import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flowery_delivery/core/networking/error/error_model.dart';
import 'package:flowery_delivery/features/home/presentation/viewModel/pending_orders_actions.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/response/pending_order_response_entity.dart';
import '../../domain/use_cases/pending_orders_usecase.dart';

part 'pending_order_view_model_state.dart';

@injectable
class PendingOrderViewModelCubit extends Cubit<PendingOrderViewModelState> {
  final PendingOrderUseCase _useCase;

  PendingOrderViewModelCubit(this._useCase)
      : super(PendingOrderViewModelInitial());

  void onAction(PendingOrdersActions action) {
    switch (action) {
      case GetPendingOrders():
        _getPendingOrders();
        break;
    }
  }

  Future<void> _getPendingOrders() async {
    emit(PendingOrderViewModelLoading());
    final result = await _useCase.getPendingOrders();
    switch (result) {
      case Success<PendingOrderResponseEntity>():
        emit(PendingOrderViewModelLoaded(result.data));
        break;
      case Fail<PendingOrderResponseEntity>():
        emit(
            PendingOrderViewModelError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
