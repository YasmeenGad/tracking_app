import 'package:flowery_delivery/features/driver_orders/domain/entities/response/driver_order_entity.dart';
import '../../../../../../core/networking/common/api_result.dart';

abstract class DriverOrdersOnlineDataSource {
  Future<DataResult<DriverOrderEntity>> getDriverOrders( {required int limit });
}
