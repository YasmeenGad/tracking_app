import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/order_details/domain/repositories/contract/order_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeOrderStatusCase {
  final OrderDetailsRepo _repository;

  ChangeOrderStatusCase(this._repository);

  Future<DataResult<void>> call(
      {required String orderId, required String state}) async {
    return await _repository.changeOrderStatus(orderId: orderId, state: state);
  }
}
