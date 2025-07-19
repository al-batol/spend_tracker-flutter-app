part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final bool isPassHidden;
  final bool isPolicyChecked;
  final AuthStatus? status;
  final String? message;
  final Map<String, dynamic> errors;
  const AuthState({
    this.isPassHidden = true,
    this.isPolicyChecked = false,
    this.errors = const {},
    this.status = AuthStatus.initial,
    this.message,
  });

  AuthState copyWith({
    bool? isPassHidden,
    bool? isPolicyChecked,
    AuthStatus? status,
    String? message,
    Map<String, dynamic>? errors,
  }) {
    return AuthState(
      isPassHidden: isPassHidden ?? this.isPassHidden,
      isPolicyChecked: isPolicyChecked ?? this.isPolicyChecked,
      errors: errors ?? this.errors,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [isPassHidden, isPolicyChecked, errors, status!];
}
