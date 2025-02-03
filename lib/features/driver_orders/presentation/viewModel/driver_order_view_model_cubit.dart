import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flowery_delivery/core/networking/error/error_model.dart';
import 'package:flowery_delivery/features/driver_orders/presentation/viewModel/driver_orders_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/response/driver_order_entity.dart';
import '../../domain/use_cases/driver_orders_use_case.dart';

part 'driver_order_view_model_state.dart';

@injectable
class DriverOrderViewModelCubit extends Cubit<DriverOrderViewModelState> {
  final DriverOrderUseCase _useCase;

  DriverOrderViewModelCubit(this._useCase)
      : super(DriverOrderViewModelInitial()){
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }
late ScrollController scrollController;
 int limit = 10;
 int totalItems = 0;
  bool isLoadingMore = false;
  Future<void> onAction(DriverOrdersActions action) async {
    switch (action) {
      case GetMyOrders():
        _getDriverOrders();
        break;
    }
  }

  Future<void> _getDriverOrders( ) async {
    emit(DriverOrderViewModelLoading());
    final result = await _useCase.getDriverOrders( limit: limit);
    switch (result) {
      case Success<DriverOrderEntity>():
        totalItems = result.data.metadata.totalItems;
        emit(DriverOrderViewModelLoaded(result.data));
        break;
      case Fail<DriverOrderEntity>():
        emit(
            DriverOrderViewModelError(ErrorHandler.handle(result.exception!)));
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
    _getDriverOrders().then((_) {
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
