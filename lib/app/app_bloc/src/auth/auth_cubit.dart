import '../../../../domain/core/core.dart';
import '../../../../domain/repository/repository.dart';
import '../../../../domain/usecase/usecase.dart';
import '../../app_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUsecase;
  AuthCubit(this.authUsecase) : super(const AuthInitial());

  Future<void> fetch() async {
    emit(const AuthLoading());
    final res = await authUsecase.fetch();
    if (res.status == Status.completed) {
      emit(AuthLoaded(res.data!));
    } else {
      emit(AuthError(res.message));
    }
  }
}
