import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flowery_delivery/features/auth/data/models/response/apply_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/request/apply_request_dto.dart';
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
  Future<ApplyResponseDto> applyDriver(@Part() ApplyRequestDto applyRequestDto);
}
