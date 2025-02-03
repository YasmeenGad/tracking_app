import '../../../../core/networking/common/api_result.dart';
import '../entities/response/driver_order_entity.dart';

abstract class DriverOrdersRepo {
  Future<DataResult<DriverOrderEntity>> getDriverOrders( {required int limit });
}
