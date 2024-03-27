part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthLoaded extends AuthState {
  final DynamicModel dynamicModel;
  const AuthLoaded(this.dynamicModel);
}

class AuthError extends AuthState {
  final String? error;
  const AuthError(this.error);
}
