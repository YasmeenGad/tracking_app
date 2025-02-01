import 'package:flowery_delivery/core/networking/api/api_manager.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/home/data/data_sources/impl/pending_orders_online_data_source_impl.dart';
import 'package:flowery_delivery/features/home/data/models/response/pending_order_response_dto.dart';
import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'pending_orders_online_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late PendingOrdersOnlineDataSourceImpl onlineDataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    onlineDataSource = PendingOrdersOnlineDataSourceImpl(mockApiManager);
  });

  group('getPendingOrders', () {
    test('should return PendingOrderResponseDto on success', () async {
      final PendingOrderResponseDto response = PendingOrderResponseDto(
        "Success",
        PendingOrderResponseDtoMetadata(1, 1, 1, 10),
        [],
      );
      when(mockApiManager.getPendingOrders(20)).thenAnswer((_) async => response);
      final result = await onlineDataSource.getPendingOrders(limit: 20);
      expect(result, isA<Success<PendingOrderResponseEntity>>());
    });

    test('should return PendingOrderResponseDto on error', () async {
      when(mockApiManager.getPendingOrders(20)).thenThrow(Exception());
      final result = await onlineDataSource.getPendingOrders(limit: 20);
      expect(result, isA<Fail<PendingOrderResponseEntity>>());
    });
  });
}
