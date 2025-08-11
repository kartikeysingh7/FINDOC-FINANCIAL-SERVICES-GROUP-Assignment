part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;
  final String? email;
  final String? password;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.email,
    this.password,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    String? email,
    String? password,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, email, password];
}