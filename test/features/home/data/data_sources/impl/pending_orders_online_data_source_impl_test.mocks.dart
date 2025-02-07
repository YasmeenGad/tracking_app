// Mocks generated by Mockito 5.4.5 from annotations
// in flowery_delivery/test/features/home/data/data_sources/impl/pending_orders_online_data_source_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i16;
import 'dart:io' as _i17;

import 'package:flowery_delivery/core/networking/api/api_manager.dart' as _i15;
import 'package:flowery_delivery/features/auth/data/models/request/forget_password_request_dto.dart'
    as _i20;
import 'package:flowery_delivery/features/auth/data/models/request/login_request_dto.dart'
    as _i18;
import 'package:flowery_delivery/features/auth/data/models/request/reset_password_request_dto.dart'
    as _i22;
import 'package:flowery_delivery/features/auth/data/models/request/signup_request_dto.dart'
    as _i19;
import 'package:flowery_delivery/features/auth/data/models/request/verify_reset_code_request_dto.dart'
    as _i21;
import 'package:flowery_delivery/features/auth/data/models/response/apply_response_dto.dart'
    as _i2;
import 'package:flowery_delivery/features/auth/data/models/response/forget_password_response_dto.dart'
    as _i5;
import 'package:flowery_delivery/features/auth/data/models/response/login_response_dto.dart'
    as _i3;
import 'package:flowery_delivery/features/auth/data/models/response/reset_password_response_dto.dart'
    as _i7;
import 'package:flowery_delivery/features/auth/data/models/response/signup_response_dto.dart'
    as _i4;
import 'package:flowery_delivery/features/auth/data/models/response/verify_reset_code_response.dart'
    as _i6;
import 'package:flowery_delivery/features/driver_orders/data/models/response/driver_order_response_dto.dart'
    as _i14;
import 'package:flowery_delivery/features/home/data/models/response/pending_order_response_dto.dart'
    as _i13;
import 'package:flowery_delivery/features/order_details/data/models/change_order_state_dto.dart'
    as _i24;
import 'package:flowery_delivery/features/profile/data/models/request/change_password_request_dto.dart'
    as _i23;
import 'package:flowery_delivery/features/profile/data/models/response/change_password_response_dto.dart'
    as _i12;
import 'package:flowery_delivery/features/profile/data/models/response/edit_profile_response_dto.dart'
    as _i9;
import 'package:flowery_delivery/features/profile/data/models/response/get_all_vehicles_dto.dart'
    as _i11;
import 'package:flowery_delivery/features/profile/data/models/response/get_logged_driver_data_response_dto.dart'
    as _i8;
import 'package:flowery_delivery/features/profile/data/models/response/upload_photo_response_dto.dart'
    as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApplyResponseDto_0 extends _i1.SmartFake
    implements _i2.ApplyResponseDto {
  _FakeApplyResponseDto_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLoginResponseDto_1 extends _i1.SmartFake
    implements _i3.LoginResponseDto {
  _FakeLoginResponseDto_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeSignUpResponseDto_2 extends _i1.SmartFake
    implements _i4.SignUpResponseDto {
  _FakeSignUpResponseDto_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeForgetPasswordResponseDto_3 extends _i1.SmartFake
    implements _i5.ForgetPasswordResponseDto {
  _FakeForgetPasswordResponseDto_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeVerifyResetCodeResponseDto_4 extends _i1.SmartFake
    implements _i6.VerifyResetCodeResponseDto {
  _FakeVerifyResetCodeResponseDto_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeResetPasswordResponseDto_5 extends _i1.SmartFake
    implements _i7.ResetPasswordResponseDto {
  _FakeResetPasswordResponseDto_5(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGetLoggedDriverDataResponseDto_6 extends _i1.SmartFake
    implements _i8.GetLoggedDriverDataResponseDto {
  _FakeGetLoggedDriverDataResponseDto_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(parent, parentInvocation);
}

class _FakeEditProfileResponseDto_7 extends _i1.SmartFake
    implements _i9.EditProfileResponseDto {
  _FakeEditProfileResponseDto_7(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeUploadPhotoResponseDto_8 extends _i1.SmartFake
    implements _i10.UploadPhotoResponseDto {
  _FakeUploadPhotoResponseDto_8(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGetAllVehiclesDto_9 extends _i1.SmartFake
    implements _i11.GetAllVehiclesDto {
  _FakeGetAllVehiclesDto_9(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeChangePasswordResponseDto_10 extends _i1.SmartFake
    implements _i12.ChangePasswordResponseDto {
  _FakeChangePasswordResponseDto_10(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakePendingOrderResponseDto_11 extends _i1.SmartFake
    implements _i13.PendingOrderResponseDto {
  _FakePendingOrderResponseDto_11(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeDriverOrderResponseDto_12 extends _i1.SmartFake
    implements _i14.DriverOrderResponseDto {
  _FakeDriverOrderResponseDto_12(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiManager extends _i1.Mock implements _i15.ApiManager {
  MockApiManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i16.Future<_i2.ApplyResponseDto> applyDriver(
    String? country,
    String? firstName,
    String? lastName,
    String? vechicleType,
    String? vechicleNumber,
    _i17.File? vechicleLicense,
    String? nID,
    _i17.File? nIDImg,
    String? email,
    String? password,
    String? rePassword,
    String? gender,
    String? phone,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#applyDriver, [
              country,
              firstName,
              lastName,
              vechicleType,
              vechicleNumber,
              vechicleLicense,
              nID,
              nIDImg,
              email,
              password,
              rePassword,
              gender,
              phone,
            ]),
            returnValue: _i16.Future<_i2.ApplyResponseDto>.value(
              _FakeApplyResponseDto_0(
                this,
                Invocation.method(#applyDriver, [
                  country,
                  firstName,
                  lastName,
                  vechicleType,
                  vechicleNumber,
                  vechicleLicense,
                  nID,
                  nIDImg,
                  email,
                  password,
                  rePassword,
                  gender,
                  phone,
                ]),
              ),
            ),
          )
          as _i16.Future<_i2.ApplyResponseDto>);

  @override
  _i16.Future<_i3.LoginResponseDto> login(_i18.LoginRequestDto? request) =>
      (super.noSuchMethod(
            Invocation.method(#login, [request]),
            returnValue: _i16.Future<_i3.LoginResponseDto>.value(
              _FakeLoginResponseDto_1(
                this,
            Invocation.method(#login, [request]),
          ),
            ),
      ) as _i16.Future<_i3.LoginResponseDto>);

  @override
  _i16.Future<_i4.SignUpResponseDto> signUp(_i19.SignUpRequestDto? request) =>
      (super.noSuchMethod(
            Invocation.method(#signUp, [request]),
            returnValue: _i16.Future<_i4.SignUpResponseDto>.value(
              _FakeSignUpResponseDto_2(
                this,
            Invocation.method(#signUp, [request]),
          ),
            ),
      ) as _i16.Future<_i4.SignUpResponseDto>);

  @override
  _i16.Future<_i5.ForgetPasswordResponseDto> forgetPassword(
    _i20.ForgetPasswordRequestDto? request,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#forgetPassword, [request]),
            returnValue: _i16.Future<_i5.ForgetPasswordResponseDto>.value(
              _FakeForgetPasswordResponseDto_3(
                this,
            Invocation.method(#forgetPassword, [request]),
          ),
            ),
      ) as _i16.Future<_i5.ForgetPasswordResponseDto>);

  @override
  _i16.Future<_i6.VerifyResetCodeResponseDto> verifyResetCode(
    _i21.VerifyResetCodeRequestDto? resetCode,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#verifyResetCode, [resetCode]),
            returnValue: _i16.Future<_i6.VerifyResetCodeResponseDto>.value(
              _FakeVerifyResetCodeResponseDto_4(
                this,
            Invocation.method(#verifyResetCode, [resetCode]),
          ),
            ),
      ) as _i16.Future<_i6.VerifyResetCodeResponseDto>);

  @override
  _i16.Future<_i7.ResetPasswordResponseDto> resetPassword(
    _i22.ResetPasswordRequestDto? resetPassword,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#resetPassword, [resetPassword]),
            returnValue: _i16.Future<_i7.ResetPasswordResponseDto>.value(
              _FakeResetPasswordResponseDto_5(
                this,
            Invocation.method(#resetPassword, [resetPassword]),
          ),
            ),
      ) as _i16.Future<_i7.ResetPasswordResponseDto>);

  @override
  _i16.Future<_i8.GetLoggedDriverDataResponseDto> getLoggedDriverData() =>
      (super.noSuchMethod(
            Invocation.method(#getLoggedDriverData, []),
            returnValue: _i16.Future<_i8.GetLoggedDriverDataResponseDto>.value(
              _FakeGetLoggedDriverDataResponseDto_6(
                this,
            Invocation.method(#getLoggedDriverData, []),
          ),
            ),
      ) as _i16.Future<_i8.GetLoggedDriverDataResponseDto>);

  @override
  _i16.Future<_i9.EditProfileResponseDto> editProfile(
    Map<String, dynamic>? body,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#editProfile, [body]),
            returnValue: _i16.Future<_i9.EditProfileResponseDto>.value(
              _FakeEditProfileResponseDto_7(
                this,
            Invocation.method(#editProfile, [body]),
          ),
            ),
      ) as _i16.Future<_i9.EditProfileResponseDto>);

  @override
  _i16.Future<_i10.UploadPhotoResponseDto> uploadPhoto(_i17.File? photo) =>
      (super.noSuchMethod(
            Invocation.method(#uploadPhoto, [photo]),
            returnValue: _i16.Future<_i10.UploadPhotoResponseDto>.value(
              _FakeUploadPhotoResponseDto_8(
                this,
            Invocation.method(#uploadPhoto, [photo]),
          ),
            ),
      ) as _i16.Future<_i10.UploadPhotoResponseDto>);

  @override
  _i16.Future<_i11.GetAllVehiclesDto> getAllVehicles() =>
      (super.noSuchMethod(
        Invocation.method(#getAllVehicles, []),
        returnValue: _i16.Future<_i11.GetAllVehiclesDto>.value(
              _FakeGetAllVehiclesDto_9(
                this,
            Invocation.method(#getAllVehicles, []),
          ),
            ),
      ) as _i16.Future<_i11.GetAllVehiclesDto>);

  @override
  _i16.Future<_i12.ChangePasswordResponseDto> changePassword(
    _i23.ChangePasswordRequestDto? request,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#changePassword, [request]),
            returnValue: _i16.Future<_i12.ChangePasswordResponseDto>.value(
              _FakeChangePasswordResponseDto_10(
                this,
            Invocation.method(#changePassword, [request]),
          ),
            ),
      ) as _i16.Future<_i12.ChangePasswordResponseDto>);

  @override
  _i16.Future<_i13.PendingOrderResponseDto> getPendingOrders(int? limit) =>
      (super.noSuchMethod(
            Invocation.method(#getPendingOrders, [limit]),
            returnValue: _i16.Future<_i13.PendingOrderResponseDto>.value(
              _FakePendingOrderResponseDto_11(
                this,
            Invocation.method(#getPendingOrders, [limit]),
          ),
            ),
      ) as _i16.Future<_i13.PendingOrderResponseDto>);

  @override
  _i16.Future<_i14.DriverOrderResponseDto> getDriverOrders(int? limit) =>
      (super.noSuchMethod(
            Invocation.method(#getDriverOrders, [limit]),
            returnValue: _i16.Future<_i14.DriverOrderResponseDto>.value(
              _FakeDriverOrderResponseDto_12(
                this,
                Invocation.method(#getDriverOrders, [limit]),
              ),
            ),
          )
          as _i16.Future<_i14.DriverOrderResponseDto>);

  @override
  _i16.Future<void> startOrder(String? id) =>
      (super.noSuchMethod(
        Invocation.method(#startOrder, [id]),
        returnValue: _i16.Future<void>.value(),
            returnValueForMissingStub: _i16.Future<void>.value(),
          )
          as _i16.Future<void>);

  @override
  _i16.Future<void> changeOrderStatus(
    String? id,
    _i24.ChangeOrderStateDto? state,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#changeOrderStatus, [id, state]),
            returnValue: _i16.Future<void>.value(),
            returnValueForMissingStub: _i16.Future<void>.value(),
          )
          as _i16.Future<void>);
}
