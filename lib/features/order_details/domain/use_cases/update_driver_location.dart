import 'package:flowery_delivery/features/order_details/domain/repositories/contract/order_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../data/models/order_details_model.dart';

@injectable
class UpdateDriverLocationUseCase {
  final OrderDetailsRepo _repo;

  @factoryMethod
  UpdateDriverLocationUseCase(this._repo);

  Future<DataResult<void>> execute(
          {required String orderId,
          required String userId,
          required LocationModel location}) =>
      _repo.updateLocation(
          orderId: orderId, userId: userId, location: location);
}
