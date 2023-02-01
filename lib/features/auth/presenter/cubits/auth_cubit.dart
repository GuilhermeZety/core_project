import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(): super(AuthInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool formValidated = false;

  void login() {
    formValidated = true;
    if (formKey.currentState!.validate()) {
      emit(AuthLoading());
      Future.delayed(Duration(seconds: 3), () {
        emit(AuthSuccess());
      });
    }
    else{
      emit(AuthError());
    }
  }
}
