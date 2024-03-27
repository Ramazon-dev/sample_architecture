import 'package:alice/alice.dart';
import 'package:alice/core/alice_dio_interceptor.dart';
import 'package:injectable/injectable.dart';

import '../../../../database/app_storage.dart';
import '../../../network.dart';
import '../impl/auth_provider_impl.dart';

@module
abstract class NetworkServiceModule {
  @lazySingleton
  AuthProvider provideAuthProvider(Dio dio, AppStorage storage) =>
      AuthProviderImpl(dio, storage);

  @lazySingleton
  AliceDioInterceptor provideInterceptor(Alice alice) =>
      alice.getDioInterceptor();

  @lazySingleton
  Dio provideDio(
    AliceDioInterceptor aliceDioInterceptor,
  ) {
    final dio = Dio();
    return dio..interceptors.add(aliceDioInterceptor);
  }

  @lazySingleton
  Alice provideAlice() => Alice();
}
