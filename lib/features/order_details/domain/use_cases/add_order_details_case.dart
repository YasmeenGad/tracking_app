import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/order_details/domain/entities/order_details_entity.dart';
import 'package:flowery_delivery/features/order_details/domain/repositories/contract/order_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddOrderDetailsCase {
  final OrderDetailsRepo repository;

  AddOrderDetailsCase(this.repository);

  Future<DataResult<void>> call({required OrderDetailsEntity orderDetails}) async {
    // await repository.statOrder(orderId: orderDetails.orders!.id!);
    // check if order is already placed
    return await repository.addOrderDetails(orderDetails: orderDetails);
  }
}
