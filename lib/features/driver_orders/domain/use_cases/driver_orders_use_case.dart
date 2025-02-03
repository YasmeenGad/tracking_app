import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/driver_orders_repo.dart';
import '../entities/response/driver_order_entity.dart';

@injectable
class DriverOrderUseCase {
  final DriverOrdersRepo _repo;

  @factoryMethod
  DriverOrderUseCase(this._repo);

  Future<DataResult<DriverOrderEntity>> getDriverOrders( {required int limit }) async =>
      await _repo.getDriverOrders(limit: limit);
}
