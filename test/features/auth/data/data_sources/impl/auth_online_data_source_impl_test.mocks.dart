// Mocks generated by Mockito 5.4.5 from annotations
// in flowery_delivery/test/features/auth/data/data_sources/impl/auth_online_data_source_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i14;
import 'dart:io' as _i20;

import 'package:flowery_delivery/core/networking/api/api_manager.dart' as _i13;
import 'package:flowery_delivery/features/auth/data/models/request/forget_password_request_dto.dart'
    as _i17;
import 'package:flowery_delivery/features/auth/data/models/request/login_request_dto.dart'
    as _i15;
import 'package:flowery_delivery/features/auth/data/models/request/reset_password_request_dto.dart'
    as _i19;
import 'package:flowery_delivery/features/auth/data/models/request/signup_request_dto.dart'
    as _i16;
import 'package:flowery_delivery/features/auth/data/models/request/verify_reset_code_request_dto.dart'
    as _i18;
import 'package:flowery_delivery/features/auth/data/models/response/forget_password_response_dto.dart'
    as _i4;
import 'package:flowery_delivery/features/auth/data/models/response/login_response_dto.dart'
    as _i2;
import 'package:flowery_delivery/features/auth/data/models/response/reset_password_response_dto.dart'
    as _i6;
import 'package:flowery_delivery/features/auth/data/models/response/signup_response_dto.dart'
    as _i3;
import 'package:flowery_delivery/features/auth/data/models/response/verify_reset_code_response.dart'
    as _i5;
import 'package:flowery_delivery/features/home/data/models/response/pending_order_response_dto.dart'
    as _i12;
import 'package:flowery_delivery/features/profile/data/models/request/change_password_request_dto.dart'
    as _i21;
import 'package:flowery_delivery/features/profile/data/models/response/change_password_response_dto.dart'
    as _i11;
import 'package:flowery_delivery/features/profile/data/models/response/edit_profile_response_dto.dart'
    as _i8;
import 'package:flowery_delivery/features/profile/data/models/response/get_all_vehicles_dto.dart'
    as _i10;
import 'package:flowery_delivery/features/profile/data/models/response/get_logged_driver_data_response_dto.dart'
    as _i7;
import 'package:flowery_delivery/features/profile/data/models/response/upload_photo_response_dto.dart'
    as _i9;
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

class _FakeLoginResponseDto_0 extends _i1.SmartFake
    implements _i2.LoginResponseDto {
  _FakeLoginResponseDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSignUpResponseDto_1 extends _i1.SmartFake
    implements _i3.SignUpResponseDto {
  _FakeSignUpResponseDto_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForgetPasswordResponseDto_2 extends _i1.SmartFake
    implements _i4.ForgetPasswordResponseDto {
  _FakeForgetPasswordResponseDto_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerifyResetCodeResponseDto_3 extends _i1.SmartFake
    implements _i5.VerifyResetCodeResponseDto {
  _FakeVerifyResetCodeResponseDto_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResetPasswordResponseDto_4 extends _i1.SmartFake
    implements _i6.ResetPasswordResponseDto {
  _FakeResetPasswordResponseDto_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetLoggedDriverDataResponseDto_5 extends _i1.SmartFake
    implements _i7.GetLoggedDriverDataResponseDto {
  _FakeGetLoggedDriverDataResponseDto_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEditProfileResponseDto_6 extends _i1.SmartFake
    implements _i8.EditProfileResponseDto {
  _FakeEditProfileResponseDto_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUploadPhotoResponseDto_7 extends _i1.SmartFake
    implements _i9.UploadPhotoResponseDto {
  _FakeUploadPhotoResponseDto_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetAllVehiclesDto_8 extends _i1.SmartFake
    implements _i10.GetAllVehiclesDto {
  _FakeGetAllVehiclesDto_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeChangePasswordResponseDto_9 extends _i1.SmartFake
    implements _i11.ChangePasswordResponseDto {
  _FakeChangePasswordResponseDto_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePendingOrderResponseDto_10 extends _i1.SmartFake
    implements _i12.PendingOrderResponseDto {
  _FakePendingOrderResponseDto_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiManager extends _i1.Mock implements _i13.ApiManager {
  MockApiManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.Future<_i2.LoginResponseDto> login(_i15.LoginRequestDto? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [request],
        ),
        returnValue:
            _i14.Future<_i2.LoginResponseDto>.value(_FakeLoginResponseDto_0(
          this,
          Invocation.method(
            #login,
            [request],
          ),
        )),
      ) as _i14.Future<_i2.LoginResponseDto>);

  @override
  _i14.Future<_i3.SignUpResponseDto> signUp(_i16.SignUpRequestDto? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [request],
        ),
        returnValue:
            _i14.Future<_i3.SignUpResponseDto>.value(_FakeSignUpResponseDto_1(
          this,
          Invocation.method(
            #signUp,
            [request],
          ),
        )),
      ) as _i14.Future<_i3.SignUpResponseDto>);

  @override
  _i14.Future<_i4.ForgetPasswordResponseDto> forgetPassword(
          _i17.ForgetPasswordRequestDto? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgetPassword,
          [request],
        ),
        returnValue: _i14.Future<_i4.ForgetPasswordResponseDto>.value(
            _FakeForgetPasswordResponseDto_2(
          this,
          Invocation.method(
            #forgetPassword,
            [request],
          ),
        )),
      ) as _i14.Future<_i4.ForgetPasswordResponseDto>);

  @override
  _i14.Future<_i5.VerifyResetCodeResponseDto> verifyResetCode(
          _i18.VerifyResetCodeRequestDto? resetCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetCode,
          [resetCode],
        ),
        returnValue: _i14.Future<_i5.VerifyResetCodeResponseDto>.value(
            _FakeVerifyResetCodeResponseDto_3(
          this,
          Invocation.method(
            #verifyResetCode,
            [resetCode],
          ),
        )),
      ) as _i14.Future<_i5.VerifyResetCodeResponseDto>);

  @override
  _i14.Future<_i6.ResetPasswordResponseDto> resetPassword(
          _i19.ResetPasswordRequestDto? resetPassword) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [resetPassword],
        ),
        returnValue: _i14.Future<_i6.ResetPasswordResponseDto>.value(
            _FakeResetPasswordResponseDto_4(
          this,
          Invocation.method(
            #resetPassword,
            [resetPassword],
          ),
        )),
      ) as _i14.Future<_i6.ResetPasswordResponseDto>);

  @override
  _i14.Future<_i7.GetLoggedDriverDataResponseDto> getLoggedDriverData() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLoggedDriverData,
          [],
        ),
        returnValue: _i14.Future<_i7.GetLoggedDriverDataResponseDto>.value(
            _FakeGetLoggedDriverDataResponseDto_5(
          this,
          Invocation.method(
            #getLoggedDriverData,
            [],
          ),
        )),
      ) as _i14.Future<_i7.GetLoggedDriverDataResponseDto>);

  @override
  _i14.Future<_i8.EditProfileResponseDto> editProfile(
          Map<String, dynamic>? body) =>
      (super.noSuchMethod(
        Invocation.method(
          #editProfile,
          [body],
        ),
        returnValue: _i14.Future<_i8.EditProfileResponseDto>.value(
            _FakeEditProfileResponseDto_6(
          this,
          Invocation.method(
            #editProfile,
            [body],
          ),
        )),
      ) as _i14.Future<_i8.EditProfileResponseDto>);

  @override
  _i14.Future<_i9.UploadPhotoResponseDto> uploadPhoto(_i20.File? photo) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadPhoto,
          [photo],
        ),
        returnValue: _i14.Future<_i9.UploadPhotoResponseDto>.value(
            _FakeUploadPhotoResponseDto_7(
          this,
          Invocation.method(
            #uploadPhoto,
            [photo],
          ),
        )),
      ) as _i14.Future<_i9.UploadPhotoResponseDto>);

  @override
  _i14.Future<_i10.GetAllVehiclesDto> getAllVehicles() => (super.noSuchMethod(
        Invocation.method(
          #getAllVehicles,
          [],
        ),
        returnValue:
            _i14.Future<_i10.GetAllVehiclesDto>.value(_FakeGetAllVehiclesDto_8(
          this,
          Invocation.method(
            #getAllVehicles,
            [],
          ),
        )),
      ) as _i14.Future<_i10.GetAllVehiclesDto>);

  @override
  _i14.Future<_i11.ChangePasswordResponseDto> changePassword(
          _i21.ChangePasswordRequestDto? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #changePassword,
          [request],
        ),
        returnValue: _i14.Future<_i11.ChangePasswordResponseDto>.value(
            _FakeChangePasswordResponseDto_9(
          this,
          Invocation.method(
            #changePassword,
            [request],
          ),
        )),
      ) as _i14.Future<_i11.ChangePasswordResponseDto>);

  @override
  _i14.Future<_i12.PendingOrderResponseDto> getPendingOrders() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPendingOrders,
          [],
        ),
        returnValue: _i14.Future<_i12.PendingOrderResponseDto>.value(
            _FakePendingOrderResponseDto_10(
          this,
          Invocation.method(
            #getPendingOrders,
            [],
          ),
        )),
      ) as _i14.Future<_i12.PendingOrderResponseDto>);
}
