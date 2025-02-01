import 'package:bloc/bloc.dart';
import 'package:flowery_delivery/features/profile/presentation/viewModel/profile_actions.dart';
import 'package:flowery_delivery/features/profile/presentation/viewModel/vehicles/vehicles_action.dart';
import 'package:flowery_delivery/features/profile/presentation/viewModel/vehicles/vehicles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/error_handler.dart';
import '../../../../core/networking/error/error_model.dart';
import '../../domain/entities/response/get_logged_user_driver_response_entity.dart';
import '../../domain/use_cases/profile_use_case.dart';

part 'profile_view_model_state.dart';

@injectable
class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  final ProfileUseCase _useCase;
  final VehiclesCubit _vehiclesCubit;
  GetLoggedDriverDataResponseEntity? driverDataResponseEntity;

  @factoryMethod
  ProfileViewModelCubit(this._useCase, this._vehiclesCubit)
      : super(ProfileViewModelInitial());

  Future<void> doAction(ProfileActions action) async {
    switch (action) {
      case GetLoggedUserData():
        _getLoggedUserData();
    }
  }

  Future<void> _getLoggedUserData() async {
    emit(GetLoggedUserDataLoading());
    final result = await _useCase.getProfileData();
    switch (result) {
      case Success<GetLoggedDriverDataResponseEntity>():
        _vehiclesCubit.doAction(GetAllVehicles());
        driverDataResponseEntity = result.data;
        debugPrint('');
        debugPrint('************ driver ====>>> ${driverDataResponseEntity!.driver!}');
        debugPrint('************ driver ====>>> ${driverDataResponseEntity!.driver!.firstName}');
        emit(GetLoggedUserDataSuccess(
            data: driverDataResponseEntity = result.data));
      case Fail<GetLoggedDriverDataResponseEntity>():
        emit(GetLoggedUserDataError(
            error: ErrorHandler.handle(result.exception!)));
    }
  }
}
