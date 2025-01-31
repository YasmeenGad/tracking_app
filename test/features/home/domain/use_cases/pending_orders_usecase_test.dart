import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/home/domain/contracts/pending_orders_repo.dart';
import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:flowery_delivery/features/home/domain/use_cases/pending_orders_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pending_orders_usecase_test.mocks.dart';

@GenerateMocks([PendingOrdersRepo])
void main() {
  late MockPendingOrdersRepo mockRepo;
  late PendingOrderUseCase useCase;

  setUp(() {
    mockRepo = MockPendingOrdersRepo();
    useCase = PendingOrderUseCase(mockRepo);
    provideDummy<DataResult<PendingOrderResponseEntity>>(
        Success<PendingOrderResponseEntity>(PendingOrderResponseEntity(
      metadata: PendingOrderResponseEntityMetadata(1, 1, 1, 10),
      orders: [],
    )));
  });

  group('pending orders use case', () {
    test('should return PendingOrderResponseEntity on success', () async {
      final PendingOrderResponseEntity response = PendingOrderResponseEntity(
        orders: [],
        metadata: PendingOrderResponseEntityMetadata(1, 1, 1, 10),
      );
      when(mockRepo.getPendingOrders()).thenAnswer(
          (_) async => Success<PendingOrderResponseEntity>(response));

      final result = await useCase.getPendingOrders();

      expect(result, isA<Success<PendingOrderResponseEntity>>());
      final successResult = result as Success<PendingOrderResponseEntity>;
      expect(successResult.data, response);
      verify(mockRepo.getPendingOrders()).called(1);
    });
  });
}
