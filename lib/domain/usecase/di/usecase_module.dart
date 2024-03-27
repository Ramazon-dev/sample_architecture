import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';
import '../impl/auth_usecase_impl.dart';
import '../usecase.dart';

@module
abstract class UsecaseModule {
  @lazySingleton
  AuthUsecase provideAuthUsecase(AuthRepository authRepository) =>
      AuthUsecaseImpl(authRepository);
}
