import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:flowery_delivery/features/order_details/domain/repositories/contract/order_details_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetOrderByOrderIdCase {
  final OrderDetailsRepo _repository;

  GetOrderByOrderIdCase(this._repository);

  Future<DataResult<OrderDetailsEntity>> call(
      {required String userId, required String orderId}) async {
    return await _repository.getOrderByOrderId(
        userId: userId, orderId: orderId);
  }
}
