import 'package:sample_app/domain/repository/mapping/dynamic_ext.dart';

import '../../../data/network/network.dart';
import '../../core/core.dart';
import '../repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthProvider _authProvider;

  AuthRepositoryImpl(this._authProvider);

  @override
  Future<Result<DynamicModel>> fetch() {
    return toResult2(
      _authProvider.getDynamicData(),
      fromSuccessResponse: (data) => data.data!.toModel(),
    );
  }
}
