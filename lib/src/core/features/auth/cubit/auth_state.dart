part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isPassHidden;
  final bool isPolicyChecked;
  final bool isEnabled;
  final bool isSigningUp;
  const AuthState({
    this.isPassHidden = true,
    this.isPolicyChecked = false,
    this.isEnabled = true,
    this.isSigningUp = false,
  });

  AuthState copyWith({
    bool? isPassHidden,
    bool? isPolicyChecked,
    bool? isEnabled,
    bool? isSigningUp,
  }) {
    return AuthState(
      isPassHidden: isPassHidden ?? this.isPassHidden,
      isPolicyChecked: isPolicyChecked ?? this.isPolicyChecked,
      isEnabled: isEnabled ?? this.isEnabled,
      isSigningUp: isSigningUp ?? this.isSigningUp,
    );
  }

  @override
  List<Object> get props => [isPassHidden, isPolicyChecked, isEnabled];
}
