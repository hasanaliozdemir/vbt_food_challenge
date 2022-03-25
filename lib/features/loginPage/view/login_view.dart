import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/widgets/custom_button.dart';
import 'package:vbt_food_challange/features/loginPage/service/login_service.dart';
import 'package:vbt_food_challange/features/loginPage/viewmodel/cubit/login_cubit.dart';

import '../../../product/widgets/customTextFormField.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height / 12,
                    ),
                    Container(
                      height: context.height * 0.3,
                      margin: context.paddingMedium,
                      padding: context.paddingMedium,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Form(
                      key: context.read<LoginCubit>().formKey,
                      child: Padding(
                        padding: context.horizontalPaddingLow,
                        child: Column(
                          children: [
                            AuthTextField(
                              controller:
                                  context.read<LoginCubit>().emailController,
                              hintText: "email",
                              isObsecure: false,
                              node: FocusNode(),
                              validator: EmailValidator(
                                  errorText: "Please enter your email"),
                              changeObscureCallBack: () {},
                            ),
                            AuthTextField(
                              controller:
                                  context.read<LoginCubit>().passwordController,
                              hintText: "Password",
                              node: FocusNode(),
                              isObsecure: true,
                              validator: RequiredValidator(
                                  errorText: 'password is required'),
                              changeObscureCallBack: () {
                                context.read<LoginCubit>().changeObsecure();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    CustomButton(
                        text: 'Giriş',
                        isLoading: false,
                        func: () {
                          if (context
                              .read<LoginCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            ShowLoaderDialog(context, "text");
                            LoginService().signInWithEmailAndPassword(
                                context: context,
                                email: context
                                    .read<LoginCubit>()
                                    .emailController
                                    .text,
                                password: context
                                    .read<LoginCubit>()
                                    .passwordController
                                    .text);
                          }
                        }),
                    SizedBox(height: context.height * 0.05),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/registerPage');
                      },
                      child: Text(
                        'Hesabın yok mu? Kayıt ol ',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

ShowLoaderDialog(BuildContext context, text) {
  AlertDialog alert = const AlertDialog(
    content: Text("yükleniyor bro"),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
