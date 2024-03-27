import 'package:sample_app/domain/repository/repository.dart';

import '../core/core.dart';
import 'base_repository.dart';

abstract class AuthRepository extends BaseRepository {
  Future<Result<DynamicModel>> fetch();
}
