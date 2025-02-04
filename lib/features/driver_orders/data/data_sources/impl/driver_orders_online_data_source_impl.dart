import 'package:flowery_delivery/core/networking/api_execute.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/driver_orders/data/mappers/driver_orders_mapper.dart';
import 'package:flowery_delivery/features/driver_orders/domain/entities/response/driver_order_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../contracts/online_data_source/driver_orders_online_data_source.dart';

@Injectable(as: DriverOrdersOnlineDataSource)
class DriverOrdersOnlineDataSourceImpl
    implements DriverOrdersOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  DriverOrdersOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<DriverOrderEntity>> getDriverOrders(  {required int limit }) {
    return executeApi(() async {
      var response = await _apiManager.getDriverOrders(limit );
      return DriverOrdersMapper.fromDtoList(response);
    });
  }
}
