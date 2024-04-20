part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoadingState extends AuthState {}
class SignInSuccessState extends AuthState {}
class SignInFailureState extends AuthState {
  final AuthErrorModel error;

  const SignInFailureState(this.error);
}
class SignOutSuccessState extends AuthState {}
class SignOutFailureState extends AuthState {}