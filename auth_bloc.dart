import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc_app/utils/validators.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    final email = Email.dirty(event.email);
    final password = Password.dirty(event.password);

    if (!email.isValid || !password.isValid) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Please enter valid email and password',
      ));
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // For demo purposes, accept any valid email/password
      emit(state.copyWith(
        status: AuthStatus.success,
        email: email.value,
        password: password.value,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.failure,
        errorMessage: 'Login failed. Please try again.',
      ));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState());
  }
}