import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/driver_orders/data/data_sources/contracts/online_data_source/driver_orders_online_data_source.dart';
import 'package:flowery_delivery/features/driver_orders/domain/contracts/driver_orders_repo.dart';
import 'package:flowery_delivery/features/driver_orders/domain/entities/response/driver_order_entity.dart';

import 'package:injectable/injectable.dart';


@Injectable(as: DriverOrdersRepo)
class DriverOrdersRepoImpl implements DriverOrdersRepo {
  final DriverOrdersOnlineDataSource _onlineDataSource;

  @factoryMethod
  DriverOrdersRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<DriverOrderEntity>> getDriverOrders(  {required int limit } ) async =>
      await _onlineDataSource.getDriverOrders(limit: limit );
}
