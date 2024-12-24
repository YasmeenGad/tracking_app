
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'api_constants.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  // @POST(ApiConstants.signInApi)
  // Future<LoginResponseDto> login(@Body() LoginRequestDto request);
  //
  // @POST(ApiConstants.registerApi)
  // Future<SignUpResponseDto> signUp(@Body() SignUpRequestDto request);
  //
  // @POST(ApiConstants.forgotPasswordApi)
  // Future<ForgetPasswordResponseDto> forgetPassword(
  //     @Body() ForgetPasswordRequestDto request);
  //
  // @POST(ApiConstants.verifyResetCodeApi)
  // Future<VerifyResetCodeResponseDto> verifyResetCode(
  //     @Body() VerifyResetCodeRequestDto resetCode);
  //
  // @PUT(ApiConstants.resetPasswordApi)
  // Future<ResetPasswordResponseDto> resetPassword(
  //     @Body() ResetPasswordRequestDto resetPassword);
  //
  //
  //
  // @GET(ApiConstants.getLoggedUserData)
  // Future<GetLoggedUserDataResponseDto> getLoggedUserData(
  // );
  //
  // @POST(ApiConstants.cart)
  // Future<AddToCartResponseDto> addProductToCart(
  //     @Body() AddProductToCartRequestDto body);
  // @DELETE(ApiConstants.cart)
  // Future<String> clearCartItems();
  // @PUT(ApiConstants.editProfile)
  // Future<EditProfileResponseDto> editProfile(@Body() Map<String, dynamic> body);
  //
  // @PATCH(ApiConstants.changePassword)
  // Future<ChangePasswordResponseDto> changePassword(
  //     @Body() ChangePasswordRequestDto request);


}