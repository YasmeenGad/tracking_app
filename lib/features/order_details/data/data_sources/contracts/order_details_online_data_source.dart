
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';

abstract class OrderDetailsOnlineDataSource {
  Future<DataResult<void>> addOrderDetails({required OrderDetailsEntity orderDetails});
  Future<DataResult<OrderDetailsEntity>> getOrderByOrderId({required String userId, required String orderId});
  Future<DataResult<OrderDetailsEntity>> updateOrderStatus({required String orderId,required String userId, required String status});

}
