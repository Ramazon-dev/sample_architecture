import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/bloc_observer.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'src/app_bloc_helper.dart';
export 'src/bloc_observer.dart';
export 'src/login/login_cubit.dart';
export 'src/auth/auth_cubit.dart';

class AppBloc {
  AppBloc._();

  AppBloc.init() {
    _init();
  }

  void _init() {
    if (kDebugMode) {
      Bloc.observer = AppBlocObserver();
    }
  }
}
