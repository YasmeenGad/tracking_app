import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/networking/error/error_model.dart';
import '../../../domain/entities/request/apply_request_entity.dart';
import '../../../domain/entities/response/apply_response_entity.dart';
import '../../../domain/use_cases/apply_driver_usecase.dart';

part 'apply_driver_view_model_state.dart';

@injectable
class ApplyDriverViewModelCubit extends Cubit<ApplyDriverViewModelState> {
  final ApplyDriverUseCase _useCase;

  @factoryMethod
  ApplyDriverViewModelCubit(this._useCase)
      : super(ApplyDriverViewModelInitial());

  Future<void> applyDriver(ApplyRequestEntity request) async {
    emit(ApplyDriverViewModelLoading());
    final result = await _useCase.applyDriver(request);

    switch (result) {
      case Success<ApplyResponseEntity>():
        emit(ApplyDriverViewModelSuccess(result.data));
        break;
      case Fail<ApplyResponseEntity>():
        emit(ApplyDriverViewModelError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
