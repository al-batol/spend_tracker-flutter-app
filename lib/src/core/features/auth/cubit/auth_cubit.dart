import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spend_tracker/src/core/data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(AuthState());

  void togglePasswordEye() {
    emit(state.copyWith(isPassHidden: !state.isPassHidden));
  }

  void togglePolicy() {
    emit(state.copyWith(isPolicyChecked: !state.isPolicyChecked));
  }

  void signUp(String name, String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading, errors: {}));
    if (!state.isPolicyChecked) {
      emit(
        state.copyWith(
          message: 'Please accept the terms and conditions',
          status: AuthStatus.failure,
        ),
      );
      return;
    }
    final response = await authRepository.signUp(name, email, password);
    emit(
      state.copyWith(
        errors: response.errors ?? {},
        status: response.success ? AuthStatus.success : AuthStatus.failure,
        message: response.message,
      ),
    );
  }
}
