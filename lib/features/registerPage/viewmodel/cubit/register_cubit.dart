import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';

import 'package:vbt_food_challange/features/registerPage/service/register_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final RegisterService registerService;

  bool isRegisterFail = false;
  bool isLoading = false;

  RegisterCubit({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.registerService,
  }) : super(RegisterInitial());

  void register(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      changeLoading();
      if (nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        registerService
            .createUser(
          nameController.text,
          emailController.text,
          passwordController.text,
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
    print('Yönlendiriliyor');
    try {
      Navigator.pushReplacementNamed(context, "/");

      emit(RegisterComplated(message: 'Kayıt işlemi başarılı'));
    } catch (e) {
      print(e);
      isRegisterFail = !isRegisterFail;
    }
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