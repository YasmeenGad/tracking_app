import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' hide DioMediaType;
import 'package:flowery_delivery/features/auth/data/models/response/apply_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:http_parser/http_parser.dart';
import 'api_constants.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiConstants.apply)
  @MultiPart()
  Future<ApplyResponseDto> applyDriver(
      @Part(name: 'country') String country,
      @Part(name: 'firstName') String firstName,
      @Part(name: 'lastName') String lastName,
      @Part(name: 'email') String vechicleType,
      @Part(name: 'password') String vechicleNumber,
      @Part(name: 'vehicleLicense', contentType: 'image/jpg')
      File vechicleLicense,
      @Part(name: 'nID') String nID,
      @Part(name: 'nIDImg', contentType: 'image/jpg') File nIDImg,
      @Part(name: 'email') String email,
      @Part(name: 'password') String password,
      @Part(name: 'rePassword') String rePassword,
      @Part(name: 'gender') String gender,
      @Part(name: 'phone') String phone);
}
