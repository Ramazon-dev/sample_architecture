
import '../../../../data/network/network.dart';
import '../../app_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthProvider authProvider;

  LoginCubit(this.authProvider) : super(LoginInitial());

  Future<void> login() async {
    final res = await authProvider.getUserByNumber('phone');
    res.data
        ?.map((e) => print('object login cubit e ${e.code} and ${e.rate}'))
        .toList();
  }

  Future<void> auth() async {
    await authProvider.getDynamicData();
  }
}
