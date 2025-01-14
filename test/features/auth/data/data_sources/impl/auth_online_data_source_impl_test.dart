import 'package:flowery_delivery/core/networking/api/api_manager.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:flowery_delivery/features/auth/data/data_sources/impl/auth_online_data_source_impl.dart';
import 'package:flowery_delivery/features/auth/data/models/response/signup_response_dto.dart';
import 'package:flowery_delivery/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:flowery_delivery/features/auth/domain/entities/response/signup_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'auth_online_data_source_impl_test.mocks.dart';


@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late AuthOnlineDataSourceImpl authOnlineDataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    authOnlineDataSource = AuthOnlineDataSourceImpl(mockApiManager);
  });

  group('signUp', () {
    final requestEntity = SignUpRequestEntity(
      firstName: 'haidy',
      lastName: 'hesham',
      email: 'haidy@gmail.com',
      password: 'password123',
      rePassword: 'password123',
      phone: '1234567890',
      gender: 'female',
    );

    final responseDto = SignUpResponseDto(
      message: 'Sign-up successful',
      error: null,
      token: 'token',
      user: UserDto(
        firstName: 'haidy',
        lastName: 'hesham',
        email: 'haidy@gmail.com',
        gender: 'female',
        phone: '1234567890',
        role: 'user',
        id: 'user-id',
        createdAt: '2024-11-19',
      ),
    );

    const responseEntity = SignUpResponseEntity(
      message: 'Sign-up successful',
      error: null,
      token: 'token',
      user: User(
        firstName: 'haidy',
        lastName: 'hesham',
        email: 'haidy@gmail.com',
        gender: 'female',
        phone: '1234567890',
        role: 'user',
        id: 'user-id',
        createdAt: '2024-11-19',
      ),
    );

    test('should return correct data when signUp is successful', () async {
      when(mockApiManager.signUp(any)).thenAnswer((_) async => responseDto);

      final result = await authOnlineDataSource.signUp(request: requestEntity);

      expect(result, isA<Success<SignUpResponseEntity>>());
      expect((result as Success).data, equals(responseEntity));
    });

    test('should return an error when signUp fails', () async {
      final exception = Exception('Sign-up failed');
      when(mockApiManager.signUp(any)).thenThrow(exception);

      final result = await authOnlineDataSource.signUp(request: requestEntity);

      expect(result, isA<Fail<SignUpResponseEntity>>());
      expect((result as Fail).exception, equals(exception));
    });
  });
}
