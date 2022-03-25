import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/widgets/custom_button.dart';
import 'package:vbt_food_challange/features/loginPage/view/login_view.dart';
import 'package:vbt_food_challange/features/registerPage/viewmodel/cubit/register_cubit.dart';

import '../../../product/widgets/customTextFormField.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: context.height * 0.3,
                      margin: context.paddingMedium,
                      padding: context.paddingMedium,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Form(
                      key: context.read<RegisterCubit>().formKey,
                      child: Padding(
                        padding: context.horizontalPaddingLow,
                        child: Column(
                          children: [
                            AuthTextField(
                              controller:
                                  context.read<RegisterCubit>().nameController,
                              hintText: 'Name',
                              changeObscureCallBack: () {},
                              node: context.read<RegisterCubit>().nameFocus,
                              validator:
                                  RequiredValidator(errorText: "required name"),
                            ),
                            SizedBox(height: context.height * 0.02),
                            AuthTextField(
                              controller:
                                  context.read<RegisterCubit>().emailController,
                              hintText: 'Email',
                              changeObscureCallBack: () {},
                              node: context.read<RegisterCubit>().emailFocus,
                              validator: EmailValidator(
                                  errorText: "Please enter email"),
                            ),
                            SizedBox(height: context.height * 0.02),
                            AuthTextField(
                              controller: context
                                  .read<RegisterCubit>()
                                  .passwordController,
                              hintText: 'Password',
                              isObsecure: true,
                              changeObscureCallBack: () {},
                              node: context.read<RegisterCubit>().passwordFocus,
                              validator: RequiredValidator(
                                  errorText: "required password"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    registerButton(context),
                    SizedBox(height: context.height * 0.05),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()),
                        );
                      },
                      child: Text(
                        'Hesabın var mı? Giriş ',
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

  Widget registerButton(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return CustomButton(
            text: 'Kaydet',
            isLoading: false,
            func: () {
              context.read<RegisterCubit>().register(context);
            },
          );
        });
  }
}
