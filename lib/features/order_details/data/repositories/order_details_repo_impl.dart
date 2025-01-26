import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/order_details/data/data_sources/contracts/order_details_online_data_source.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:flowery_delivery/features/order_details/domain/repositories/contract/order_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderDetailsRepo)
class OrderDetailsRepoImpl implements OrderDetailsRepo {
  final OrderDetailsOnlineDataSource _dataSource;

  @factoryMethod
  OrderDetailsRepoImpl(this._dataSource);

  @override
  Future<DataResult<void>> addOrderDetails({required OrderDetailsEntity orderDetails}) async {
    return _dataSource.addOrderDetails(orderDetails: orderDetails);
  }

  @override
  Future<DataResult<OrderDetailsEntity>> getOrderByOrderId( { required String userId ,required String orderId}) {
    return _dataSource.getOrderByOrderId(userId:  userId,orderId: orderId);
  }

  @override
  Future<DataResult<OrderDetailsEntity>> updateOrderStatus({required String userId ,required String orderId, required String status}) {
    return _dataSource.updateOrderStatus(userId: userId, orderId: orderId, status: status);
  }

  @override
  Future<DataResult<void>> statOrder({required String orderId}) {
    return _dataSource.statOrder(orderId: orderId);
  }
}
