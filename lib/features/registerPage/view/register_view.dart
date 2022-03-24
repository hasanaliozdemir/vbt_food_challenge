import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/widgets/custom_button.dart';
import 'package:vbt_food_challange/core/widgets/text_field_input.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';
import 'package:vbt_food_challange/features/loginPage/view/login_view.dart';
import 'package:vbt_food_challange/features/registerPage/service/register_service.dart';
import 'package:vbt_food_challange/features/registerPage/viewmodel/cubit/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  RegisterService registerService = RegisterService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        formKey: formKey,
        emailController: emailController,
        nameController: nameController,
        passwordController: passwordController,
        registerService: registerService,
      ),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: context.height * 0.3,
                      child: FlutterLogo(size: context.height * 0.2),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: context.horizontalPaddingLow,
                        child: Column(
                          children: [
                            TextFieldInput(
                              textEditingController: nameController,
                              hintText: 'Name',
                              textInputType: TextInputType.name,
                            ),
                            SizedBox(height: context.height * 0.02),
                            TextFieldInput(
                              textEditingController: emailController,
                              hintText: 'Email',
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: context.height * 0.02),
                            TextFieldInput(
                              textEditingController: passwordController,
                              hintText: 'Password',
                              textInputType: TextInputType.text,
                              isPass: true,
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
                          MaterialPageRoute(builder: (context) => LoginView()),
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
        if (state is RegisterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomButton(
            text: 'Kaydet',
            isLoading: false,
            func: () {
              context.read<RegisterCubit>().register(context);
            },
          );
        }
      },
    );
  }
}
