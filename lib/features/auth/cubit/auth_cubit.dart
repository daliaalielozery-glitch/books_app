import 'package:bloc/bloc.dart';
import 'package:books_app/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final response = await AuthRepo.login(email: email, password: password);
    if (response["error"] == null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(response["error"]));
    }
  }
}