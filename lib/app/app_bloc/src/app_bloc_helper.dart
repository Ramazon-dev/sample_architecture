import 'package:get_it/get_it.dart';

import '../app_bloc.dart';

mixin AppBlocHelper {
  static LoginCubit getLogInCubit() => GetIt.I.get<LoginCubit>();

  static AuthCubit getAuthCubit() => GetIt.I.get<AuthCubit>();
}
