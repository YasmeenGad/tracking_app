import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/auth/data/data_sources/contracts/apply_driver_online_data_source.dart';

import 'package:flowery_delivery/features/auth/domain/entities/request/apply_request_entity.dart';

import 'package:flowery_delivery/features/auth/domain/entities/response/apply_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/apply_driver_repo.dart';

@Injectable(as: ApplyDriverRepo)
class ApplyDriverRepoImpl implements ApplyDriverRepo {
  final ApplyDriverOnlineDataSource _onlineDataSource;

  @factoryMethod
  ApplyDriverRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<ApplyResponseEntity>> applyDriver(
      ApplyRequestEntity request) async {
    return await _onlineDataSource.applyDriver(request);
  }
}
