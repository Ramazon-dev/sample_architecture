
import '../core/core.dart';
import '../repository/repository.dart';

abstract class AuthUsecase {
  Future<Result<DynamicModel>> fetch();
}
