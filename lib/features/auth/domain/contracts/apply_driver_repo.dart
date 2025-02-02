import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/auth/domain/entities/response/apply_response_entity.dart';

import '../entities/request/apply_request_entity.dart';

abstract class ApplyDriverRepo {
  Future<DataResult<ApplyResponseEntity>> applyDriver(
      ApplyRequestEntity request);
}
