import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/pending_orders_repo.dart';
import '../entities/response/pending_order_response_entity.dart';

@injectable
class PendingOrderUseCase {
  final PendingOrdersRepo _repo;

  @factoryMethod
  PendingOrderUseCase(this._repo);

  Future<DataResult<PendingOrderResponseEntity>> getPendingOrders() async =>
      await _repo.getPendingOrders();
}
