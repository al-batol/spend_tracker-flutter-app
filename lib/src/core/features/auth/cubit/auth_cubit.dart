import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  void togglePasswordEye() {
    emit(state.copyWith(isPassHidden: !state.isPassHidden));
  }

  void togglePolicy() {
    emit(state.copyWith(isPolicyChecked: !state.isPolicyChecked));
  }

  void signUp() {
    emit(state.copyWith(isEnabled: !state.isEnabled, isSigningUp: true));
  }
}
