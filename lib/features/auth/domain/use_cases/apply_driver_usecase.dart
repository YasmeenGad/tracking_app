import 'package:flowery_delivery/features/auth/domain/contracts/apply_driver_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/request/apply_request_entity.dart';
import '../entities/response/apply_response_entity.dart';

@injectable
class ApplyDriverUseCase {
  final ApplyDriverRepo _driverRepo;

  @factoryMethod
  ApplyDriverUseCase(this._driverRepo);

  Future<DataResult<ApplyResponseEntity>> applyDriver(
          ApplyRequestEntity request) async =>
      await _driverRepo.applyDriver(request);
}
