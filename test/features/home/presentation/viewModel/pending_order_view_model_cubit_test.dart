import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/core/networking/error/error_model.dart';
import 'package:flowery_delivery/features/home/domain/entities/response/pending_order_response_entity.dart';
import 'package:flowery_delivery/features/home/domain/use_cases/pending_orders_usecase.dart';
import 'package:flowery_delivery/features/home/presentation/viewModel/pending_order_view_model_cubit.dart';
import 'package:flowery_delivery/features/home/presentation/viewModel/pending_orders_actions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'pending_order_view_model_cubit_test.mocks.dart';

@GenerateMocks([PendingOrderUseCase])
void main() {
  late MockPendingOrderUseCase mockUseCase;
  late PendingOrderViewModelCubit cubit;

  setUp(() {
    mockUseCase = MockPendingOrderUseCase();
    cubit = PendingOrderViewModelCubit(mockUseCase);
    provideDummy<DataResult<PendingOrderResponseEntity>>(
        Success<PendingOrderResponseEntity>(PendingOrderResponseEntity(
      metadata: PendingOrderResponseEntityMetadata(1, 1, 1, 10),
      orders: [],
    )));
  });

  blocTest<PendingOrderViewModelCubit, PendingOrderViewModelState>(
    'should emit [PendingOrderViewModelLoading, PendingOrderViewModelLoaded] when getPendingOrders is called',
    build: () {
      final response = PendingOrderResponseEntity(
        metadata: PendingOrderResponseEntityMetadata(1, 1, 1, 10),
        orders: [],
      );
      when(mockUseCase.getPendingOrders())
          .thenAnswer((_) async => Success(response));
      return cubit;
    },
    act: (viewModel) => viewModel.onAction(GetPendingOrders()),
    expect: () => <PendingOrderViewModelState>[
      PendingOrderViewModelLoading(),
      PendingOrderViewModelLoaded(
        PendingOrderResponseEntity(
          metadata: PendingOrderResponseEntityMetadata(1, 1, 1, 10),
          orders: [],
        ),
      ),
    ],
    verify: (_) => verify(mockUseCase.getPendingOrders()).called(1),
  );

  blocTest<PendingOrderViewModelCubit, PendingOrderViewModelState>(
    'should emit [PendingOrderViewModelLoading, PendingOrderViewModelError] when getPendingOrders is called',
    build: () {
      when(mockUseCase.getPendingOrders())
          .thenAnswer((_) async => Fail(Exception()));
      return cubit;
    },
    act: (viewModel) => viewModel.onAction(GetPendingOrders()),
    expect: () => <PendingOrderViewModelState>[
      PendingOrderViewModelLoading(),
      PendingOrderViewModelError(
          ErrorModel(error: "An unknown error occurred. Please try again.")),
      // Added period here
    ],
    verify: (_) => verify(mockUseCase.getPendingOrders()).called(1),
  );
}
