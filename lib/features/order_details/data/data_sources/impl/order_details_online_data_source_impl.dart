import 'package:firebase_core/firebase_core.dart';
import 'package:flowery_delivery/core/networking/api/api_manager.dart';
import 'package:flowery_delivery/core/networking/api_execute.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/services/firebase_helper/fire_store_helper.dart';
import 'package:flowery_delivery/core/services/firebase_helper/fire_store_ref_key.dart';
import 'package:flowery_delivery/features/order_details/data/data_sources/contracts/order_details_online_data_source.dart';
import 'package:flowery_delivery/features/order_details/data/mappers/order_details_mapper.dart';
import 'package:flowery_delivery/features/order_details/data/models/order_details_model.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderDetailsOnlineDataSource)
class OrderDetailsOnlineDataSourceImpl implements OrderDetailsOnlineDataSource {
  final FireStoreService  _fireService;
  final ApiManager _apiManager;

  @factoryMethod
  OrderDetailsOnlineDataSourceImpl(this._fireService, this._apiManager);

  @override
  Future<DataResult<void>> addOrderDetails(
      {required OrderDetailsEntity orderDetails}) async {
    return executeApi(() async {
      final orderDetailsDto =
          OrderDetailsMapper.toOrderDetailsModel(orderDetails);
      return await _fireService.fireStore
          .collection(FireStoreRefKey.users)
          .doc(orderDetailsDto.orders!.user!.id!)
          .collection(FireStoreRefKey.orders)
          .doc(orderDetailsDto.orders!.id)
          .set(orderDetailsDto.toJson());
    });
  }

  @override
  Future<DataResult<OrderDetailsEntity>> getOrderByOrderId({
    required String userId,
    required String orderId,
  }) async {
    return executeApi(() async {
      final snapshot = await _fireService.fireStore
          .collection(FireStoreRefKey.users)
          .doc(userId)
          .collection(FireStoreRefKey.orders)
          .doc(orderId)
          .get();

      if (snapshot.exists && snapshot.data() != null) {
        final orderDetailsDto = OrderDetailsModel.fromJson(snapshot.data()!);
        return OrderDetailsMapper.toOrderDetailsEntity(orderDetailsDto);
      } else {
        throw Exception('Order not found');
      }
    });
  }

  @override
  Future<DataResult<OrderDetailsEntity>> updateOrderStatus(
      {required String userId, required String orderId, required String status}) {
    return executeApi(() async {
      if (Firebase.apps.isEmpty) {
        Firebase.initializeApp();
      }
      final orderDetailsDto = OrderDetailsModel(
        orders: OrderDataModel(state: status),
      );
      return await _fireService.fireStore
          .collection(FireStoreRefKey.users)
          .doc(userId)
          .collection(FireStoreRefKey.orders)
          .doc(orderId)
          .update(orderDetailsDto.toJson())
          .then((value) {
        return OrderDetailsEntity(
          orders: OrderData(state: status),
        );
      });
    });
  }

  @override
  Future<DataResult<void>> statOrder({required String orderId}) {
    return executeApi(() async {
      return await _apiManager.startOrder(orderId);
    });
  }
}
