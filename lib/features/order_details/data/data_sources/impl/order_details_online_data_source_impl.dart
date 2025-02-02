import 'dart:async';

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
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderDetailsOnlineDataSource)
class OrderDetailsOnlineDataSourceImpl implements OrderDetailsOnlineDataSource {
  final FireStoreService _fireService;
  final ApiManager _apiManager;

  @factoryMethod
  OrderDetailsOnlineDataSourceImpl(this._fireService, this._apiManager);

  @override
  Future<DataResult<void>> addOrderDetails({
    required OrderDetailsEntity orderDetails,
  }) async {
    return executeApi(() async {
      final orderDetailsDto =
          OrderDetailsMapper.toOrderDetailsModel(orderDetails);
      final orderDetailsJson = orderDetailsDto.toJson();
      return await _fireService.fireStore
          .collection(FireStoreRefKey.users)
          .doc(orderDetailsDto.orders.user.id)
          .collection(FireStoreRefKey.orders)
          .doc(orderDetailsDto.orders.id)
          .set(orderDetailsJson);
    });
  }

  @override
  Stream<DataResult<OrderDetailsEntity>> getOrderByOrderId({
    required String userId,
    required String orderId,
  }) {
    try {
      return _fireService.fireStore
          .collection(FireStoreRefKey.users)
          .doc(userId)
          .collection(FireStoreRefKey.orders)
          .doc(orderId)
          .snapshots()
          .map(
        (event) {
          debugPrint(' $event');
          final orderDetailsDto =
              OrderDetailsModel.fromJson(event.data() as Map<String, dynamic>);
          final orderEntity =
              OrderDetailsMapper.toOrderDetailsEntity(orderDetailsDto);

          return Success(orderEntity);
        },
      );
    } catch (e) {
      return Stream.value(Fail<OrderDetailsEntity>(e as Exception?));
    }
  }

  // Map<String, dynamic> _convertToJson(Map<Object?, Object?> data) {
  //   return data
  //       .map((key, value) => MapEntry(key.toString(), _convertValue(value)));
  // }
  //
  // dynamic _convertValue(dynamic value) {
  //   if (value is Map<Object?, Object?>) {
  //     return _convertToJson(value);
  //   } else if (value is List) {
  //     return value.map((item) => _convertValue(item)).toList();
  //   } else {
  //     return value;
  //   }
  // }

  @override
  Future<DataResult<void>> updateOrderStatus(
      {required String userId,
      required String orderId,
    required String status,
  }) {
    return executeApi(() async {
      if (Firebase.apps.isEmpty) {
        Firebase.initializeApp();
      }

      return await _fireService.fireStore
          .collection(FireStoreRefKey.users)
          .doc(userId)
          .collection(FireStoreRefKey.orders)
          .doc(orderId)
          .update({FireStoreRefKey.state: status});
    });
  }

  @override
  Future<DataResult<void>> statOrder({required String orderId}) {
    return executeApi(() => _apiManager.startOrder(orderId));
  }

  @override
  Future<DataResult<void>> changeOrderStatus({required String orderId, required String state}) {
    return executeApi(() => _apiManager.changeOrderStatus(orderId, OrderDetailsMapper.toChangeOrderDto(state)));
  }

// @override
// Future<DataResult<void>> updateLocation({required String orderId, required String useId, required LocationModel location}) {
//
// }
}
