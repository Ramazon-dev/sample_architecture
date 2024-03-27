import 'package:injectable/injectable.dart';

import '../../../../data/network/network.dart';
import '../../../../domain/usecase/usecase.dart';
import '../../app_bloc.dart';

@module
abstract class AppCubitModule {
  @factoryParam
  LoginCubit provideLoginCubit(AuthProvider authProvider) =>
      LoginCubit(authProvider);

  @factoryParam
  AuthCubit provideAuthCubit(AuthUsecase authUsecase) =>
      AuthCubit(authUsecase);
}
