import '../../../../core/networking/common/api_result.dart';
import '../entities/response/pending_order_response_entity.dart';

abstract class PendingOrdersRepo {
  Future<DataResult<PendingOrderResponseEntity>> getPendingOrders( {required int limit });
}
