import 'package:flowery_delivery/features/auth/domain/contracts/auth_repo.dart';
import 'package:flowery_delivery/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowery_delivery/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:flowery_delivery/features/auth/domain/entities/response/signup_response_entity.dart';
import 'package:flowery_delivery/core/networking/common/api_result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late SignUpUseCase signUpUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signUpUseCase = SignUpUseCase(mockAuthRepository);

    provideDummy<DataResult<SignUpResponseEntity>>(
        Success(const SignUpResponseEntity()));
  });

  group('SignUpUseCase', () {
    final requestEntity = SignUpRequestEntity(
      firstName: 'Haidy',
      lastName: 'Hisham',
      email: 'haidy@gmail.com',
      password: 'password123',
      rePassword: 'password123',
      phone: '1234567890',
      gender: 'female',
    );

    const responseEntity = SignUpResponseEntity(
      message: 'Sign-up successful',
      error: null,
      token: 'token',
      user: User(
        firstName: 'Haidy',
        lastName: 'Hisham',
        email: 'haidy@gmail.com',
        gender: 'female',
        phone: '1234567890',
        role: 'user',
        id: 'user-id',
        createdAt: '2024-11-19',
      ),
    );

    test('should return successful response when signUp is successful',
        () async {
      when(mockAuthRepository.signUp(request: requestEntity))
          .thenAnswer((_) async => Success(responseEntity));

      final result = await signUpUseCase.signUp(requestEntity);

      expect(result, isA<Success<SignUpResponseEntity>>());
      expect((result as Success).data, equals(responseEntity));
    });

    test('should return failure when signUp fails', () async {
      final exception = Exception('Sign-up failed');
      when(mockAuthRepository.signUp(request: requestEntity))
          .thenAnswer((_) async => Fail(exception));

      final result = await signUpUseCase.signUp(requestEntity);

      expect(result, isA<Fail<SignUpResponseEntity>>());
      expect((result as Fail).exception, equals(exception));
    });
  });
}
