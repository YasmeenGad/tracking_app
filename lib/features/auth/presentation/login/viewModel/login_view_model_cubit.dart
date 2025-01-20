import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../../../../core/networking/error/error_model.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/services/shared_preference/location_helper.dart';
import '../../../../../di/di.dart';
import '../../../data/data_sources/contracts/offline_data_source.dart';
import '../../../domain/entities/response/login_response_entity.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_action.dart';

part 'login_view_model_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {
  final LoginUseCase _loginUseCase;
  final OfflineDataSource _offlineDataSource = getIt<OfflineDataSource>();
  final LocationHelper _locationHelper = LocationHelper();

  @factoryMethod
  LoginViewModel(this._loginUseCase) : super(LoginViewModelInitial());

  void doAction(LoginScreenAction action) {
    switch (action) {
      case LoginAction():
        _login(action, action.context);
    }
  }

  Future<void> _login(LoginAction action, BuildContext context) async {
    emit(LoginViewModelLoading());
    // Check location permission
    bool isServiceEnabled = await _locationHelper.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      emit(LocationPermissionDenied());
      return;
    }
    //
    // LocationPermission permission = await _locationHelper.requestLocationPermission(context);
    // if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
    //   emit(LocationPermissionDenied());
    //   return;
    // }

    var result = await _loginUseCase.login(action.request);
    switch (result) {
      case Success<LoginResponseEntity>():
        {
          if (action.isRememberMe) {
            await _offlineDataSource.cacheToken(result.data.token ?? "");
            debugPrint("${_offlineDataSource.getToken()}");
          }
          emit(LoginViewModelSuccess(result.data));
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pushReplacementNamed(AppRoutes.homeScreen);
          });

        }
      case Fail<LoginResponseEntity>():
        emit(LoginViewModelError(ErrorHandler.handle(result.exception!)));
    }
  }
}
