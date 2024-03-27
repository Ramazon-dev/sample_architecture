
import '../../core/core.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

class AuthUsecaseImpl extends AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecaseImpl(this._authRepository);

  @override
  Future<Result<DynamicModel>> fetch() {
    return _authRepository.fetch();
  }
}
