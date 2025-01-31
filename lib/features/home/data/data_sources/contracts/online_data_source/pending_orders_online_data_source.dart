import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';

import '../../../../../../core/networking/common/api_result.dart';

abstract class PendingOrdersOnlineDataSource {
  Future<DataResult<PendingOrderResponseEntity>> getPendingOrders();
}
