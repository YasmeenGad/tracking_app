import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/home/data/data_sources/contracts/online_data_source/pending_orders_online_data_source.dart';

import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/pending_orders_repo.dart';

@Injectable(as: PendingOrdersRepo)
class PendingOrdersRepoImpl implements PendingOrdersRepo {
  final PendingOrdersOnlineDataSource _onlineDataSource;

  @factoryMethod
  PendingOrdersRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<PendingOrderResponseEntity>> getPendingOrders() async =>
      await _onlineDataSource.getPendingOrders();
}
