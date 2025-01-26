import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flowery_delivery/core/networking/error/error_model.dart';
import 'package:flowery_delivery/features/home/presentation/viewModel/pending_orders_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/response/pending_order_response_entity.dart';
import '../../domain/use_cases/pending_orders_usecase.dart';

part 'pending_order_view_model_state.dart';

@injectable
class PendingOrderViewModelCubit extends Cubit<PendingOrderViewModelState> {
  final PendingOrderUseCase _useCase;

  PendingOrderViewModelCubit(this._useCase)
      : super(PendingOrderViewModelInitial()){
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }
late ScrollController scrollController;
 int limit = 10;
 int totalItems = 0;
  bool isLoadingMore = false;
  void onAction(PendingOrdersActions action) {
    switch (action) {
      case GetPendingOrders():
        _getPendingOrders();
        break;
    }
  }

  Future<void> _getPendingOrders( ) async {
    emit(PendingOrderViewModelLoading());
    final result = await _useCase.getPendingOrders( limit: limit);
    switch (result) {
      case Success<PendingOrderResponseEntity>():
        totalItems = result.data.metadata!.totalItems!;
        emit(PendingOrderViewModelLoaded(result.data));
        break;
      case Fail<PendingOrderResponseEntity>():
        emit(
            PendingOrderViewModelError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  void _onScroll() {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100 && !isLoadingMore) {
      loadMore();
    }
  }

  void loadMore() {
    if (isLoadingMore) return; // Prevent multiple calls

    if ( limit >= totalItems) {
      isLoadingMore = false;
      return;

    }
    if (totalItems > limit&&(totalItems - limit) < 10) {
      limit += 10;

    } else {
      limit = totalItems;

    }


    isLoadingMore = true;
    _getPendingOrders().then((_) {
      isLoadingMore = false;
    });
  }

  @override
  Future<void> close() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    return super.close();
  }

}
