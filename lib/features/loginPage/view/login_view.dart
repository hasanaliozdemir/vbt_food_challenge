import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_food_challange/core/widgets/custom_button.dart';
import 'package:vbt_food_challange/core/widgets/text_field_input.dart';
import 'package:vbt_food_challange/features/homePage/view/homePage_view.dart';
import 'package:vbt_food_challange/features/loginPage/service/login_service.dart';
import 'package:vbt_food_challange/features/loginPage/viewmodel/cubit/login_cubit.dart';
import 'package:vbt_food_challange/features/registerPage/view/register_view.dart';
import 'package:vbt_food_challange/product/widgets/appbar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    LoginService loginService = LoginService();
    return BlocProvider(
      create: (context) => LoginCubit(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
          loginService: loginService),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoginSuccess) {

//               Navigator.pushReplacementNamed(context, "/");

//               Navigator.pushNamed(
//                 context,
//                 "/homePage");
              
  

            }
            return SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.3,
                      child: FlutterLogo(
                        size: context.height * 0.2,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: context.horizontalPaddingLow,
                        child: Column(
                          children: [
                            TextFieldInput(
                              textEditingController: emailController,
                              hintText: 'Email',
                              textInputType: TextInputType.emailAddress,
                            ),
                            TextFieldInput(
                              textEditingController: passwordController,
                              hintText: 'Şifre',
                              textInputType: TextInputType.name,
                              isPass: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    loginButton(context),
                    SizedBox(height: context.height * 0.05),
                    InkWell(
                      onTap: () {

//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => RegisterView(),
//                           ),
//                         );

//                         Navigator.pushNamed(context, '/registerPage');

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

  Widget loginButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomButton(
            text: 'Giriş',
            isLoading: false,
            func: () {
              context.read<LoginCubit>().login();
            },
          );
        }
      },
    );
  }
}
