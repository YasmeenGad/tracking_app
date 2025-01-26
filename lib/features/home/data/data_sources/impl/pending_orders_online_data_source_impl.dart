import 'package:flowery_delivery/core/networking/api_execute.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/home/data/mappers/pending_orders_mapper.dart';

import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../contracts/online_data_source/pending_orders_online_data_source.dart';

@Injectable(as: PendingOrdersOnlineDataSource)
class PendingOrdersOnlineDataSourceImpl
    implements PendingOrdersOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  PendingOrdersOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<PendingOrderResponseEntity>> getPendingOrders(  {required int limit }) {
    return executeApi(() async {
      var response = await _apiManager.getPendingOrders(limit );
      return PendingOrdersMapper.toPendingOrderResponseEntity(response);
    });
  }
}
