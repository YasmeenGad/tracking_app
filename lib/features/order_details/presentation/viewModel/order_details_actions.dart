import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:flowery_delivery/features/profile/domain/entities/response/get_logged_user_driver_response_entity.dart';

import '../../data/models/order_details_model.dart';

sealed class OrderDetailsActions {}

class AddOrderDetails extends OrderDetailsActions {
  final PendingOrderResponseEntityOrders order ;
  final DriverEntity driver;

  AddOrderDetails({required this.order, required this.driver});
}


class GetOrderDetails extends OrderDetailsActions {
  final String userId;
  final String orderId;

  GetOrderDetails({
    required this.orderId,
    required this.userId,
  });
}

class UpdateOrderStatus extends OrderDetailsActions {
  final String userId;
  final String orderId;
  final String status;

  UpdateOrderStatus({
    required this.userId,
    required this.orderId,
    required this.status,
  });
}
class ChangeOrderStatus extends OrderDetailsActions {
  final String orderId;
  final String state;

  ChangeOrderStatus({
    required this.orderId,
    required this.state,
  });
}

class UpdateLocation extends OrderDetailsActions {
  final String orderId;
  final LocationModel location;
  final String userId;

  UpdateLocation({
    required this.orderId,
    required this.location,
    required this.userId,
  });
}
