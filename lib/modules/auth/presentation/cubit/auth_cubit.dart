import 'package:bloc/bloc.dart';
import 'package:bmi_app/core/errors/auth_failure.dart';
import 'package:bmi_app/modules/auth/data/repositories/base_auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseAuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());
  Future<void> signInAnonymously() async {
    emit(AuthLoadingState());
    final result = await _authRepository.signInAnonymously();
    result.fold((failure) => emit(SignInFailureState(failure.error)),
        (success) => emit(SignInSuccessState()));
  }
  Future<void> signOut() async {
    emit(AuthLoadingState());
    final result = await _authRepository.signOut();
    result.fold((failure) => emit(SignOutFailureState(failure.error)),
        (success) => emit(SignOutSuccessState()));
  }
}
