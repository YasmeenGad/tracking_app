
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';

abstract class OrderDetailsOnlineDataSource {
  Future<DataResult<void>> statOrder({required String orderId, });
  Future<DataResult<void>> addOrderDetails({required OrderDetailsEntity orderDetails});
  Stream<DataResult<OrderDetailsEntity>> getOrderByOrderId({required String userId, required String orderId});
  Future<DataResult<void>> updateOrderStatus({required String orderId,required String userId, required String status});
  Future<DataResult<void>> changeOrderStatus({required String orderId, required String state});

}
