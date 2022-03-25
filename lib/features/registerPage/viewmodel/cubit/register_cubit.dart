import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';

import 'package:vbt_food_challange/features/registerPage/service/register_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool isLoading = false;
  bool isRegisterFail = false;
  GlobalKey<FormState> formKey = GlobalKey();
  RegisterService registerService = RegisterService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode nameFocus = FocusNode();

  void register(BuildContext context) {
    if (formKey.currentState!.validate()) {
      changeLoading();
      if (nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        registerService
            .signUp(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        )
            .catchError((e) {
          emit(RegisterFailure(error: e.toString()));
        });
      }
      if (isRegisterFail == false) {
        registerSuccess(context);
      } else {
        changeLoading();
      }
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(RegisterLoading(isLoading: isLoading));
  }

  void changeError() {
    isRegisterFail = true;
    emit(RegisterFailure(error: 'Kayıt işlemi başarısız'));
  }

  void registerSuccess(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePageView()),
        (route) => false);
  }
}




/*
 .then((value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePageView()),
          (route) => false,
        );
      }).catchError((error) {
        print(error);
      });*/