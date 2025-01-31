import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/home/data/data_sources/contracts/online_data_source/pending_orders_online_data_source.dart';
import 'package:flowery_delivery/features/home/data/repositories/pending_orders_repo_impl.dart';
import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pending_orders_repo_impl_test.mocks.dart';

@GenerateMocks([PendingOrdersOnlineDataSource])
void main() {
  late MockPendingOrdersOnlineDataSource mockDataSource;
  late PendingOrdersRepoImpl repo;

  setUp(() {
    mockDataSource = MockPendingOrdersOnlineDataSource();
    repo = PendingOrdersRepoImpl(mockDataSource);
    provideDummy<DataResult<PendingOrderResponseEntity>>(
        Success<PendingOrderResponseEntity>(PendingOrderResponseEntity(
      metadata: PendingOrderResponseEntityMetadata(1, 1, 1, 10),
      orders: [],
    )));
  });

  group('getPendingOrders repo', () {
    test('should return PendingOrderResponseEntity on success', () async {
      final PendingOrderResponseEntity response = PendingOrderResponseEntity(
        metadata: PendingOrderResponseEntityMetadata(1, 1, 1, 10),
        orders: [],
      );
      when(mockDataSource.getPendingOrders()).thenAnswer(
          (_) async => Success<PendingOrderResponseEntity>(response));
      final result = await repo.getPendingOrders();
      expect(result, isA<Success<PendingOrderResponseEntity>>());
      final successResult = result as Success<PendingOrderResponseEntity>;
      expect(successResult.data, response);
      verify(mockDataSource.getPendingOrders()).called(1);
    });
    test('should return PendingOrderResponseEntity on error', () async {
      when(mockDataSource.getPendingOrders()).thenAnswer(
          (_) async => (Fail<PendingOrderResponseEntity>(Exception())));
      final result = await repo.getPendingOrders();
      expect(result, isA<Fail<PendingOrderResponseEntity>>());
      final failResult = result as Fail<PendingOrderResponseEntity>;
      expect(failResult.exception, isA<Exception>());
      verify(mockDataSource.getPendingOrders()).called(1);
    });
  });
}
