import 'package:injectable/injectable.dart';

import '../../../data/network/network.dart';
import '../impl/auth_repository_impl.dart';
import '../repository.dart';

@module
abstract class RepositoryModule {
  @lazySingleton
  AuthRepository provideAuthRepository(AuthProvider authProvider) =>
      AuthRepositoryImpl(authProvider);
}
