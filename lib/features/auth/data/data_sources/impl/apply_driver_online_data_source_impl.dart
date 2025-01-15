import 'package:flowery_delivery/core/networking/api/api_manager.dart';
import 'package:flowery_delivery/core/networking/api_execute.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/auth/data/mappers/apply_driver_mapper.dart';

import 'package:flowery_delivery/features/auth/data/models/request/apply_request_dto.dart';

import 'package:flowery_delivery/features/auth/data/models/response/apply_response_dto.dart';
import 'package:flowery_delivery/features/auth/domain/entities/request/apply_request_entity.dart';
import 'package:flowery_delivery/features/auth/domain/entities/response/apply_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../contracts/apply_driver_online_data_source.dart';

@Injectable(as: ApplyDriverOnlineDataSource)
class ApplyDriverOnlineDataSourceImpl implements ApplyDriverOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  ApplyDriverOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<ApplyResponseEntity>> applyDriver(
      ApplyRequestEntity request) {
    return executeApi(() async {
      var response =
          await _apiManager.applyDriver(ApplyDriverMapper.toDto(request));
      return ApplyDriverMapper.toEntity(response);
    });
  }
}
