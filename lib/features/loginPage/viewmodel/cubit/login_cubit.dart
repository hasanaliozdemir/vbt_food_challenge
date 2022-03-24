import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:vbt_food_challange/features/loginPage/service/login_service.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  final LoginService loginService;

  bool isLoginFail = false;
  bool isLoading = false;

  LoginCubit({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.loginService,
  }) : super(LoginInitial());

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      changeLoading();
      try {
        await loginService.signInWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading: isLoading));
  }
}
