import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/order_details/domain/repositories/contract/order_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateOrderStatusCase {
  final OrderDetailsRepo _repository;

  UpdateOrderStatusCase(this._repository);

  Future<DataResult<void>> call({
    required String userId,
    required String orderId,
    required String status,
  }) async {
    return await _repository.updateOrderStatus(
        userId: userId, orderId: orderId, status: status);
  }
}
