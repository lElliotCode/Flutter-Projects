import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/BLoCs/register_cubit/register_cubit.dart';
import 'package:form_app/presentation/widgets/widgets.dart';

final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 45),
        child: SingleChildScrollView(
          child: Column(children: [FlutterLogo(size: 150), _RegisterForm()]),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          const SizedBox(height: 25),

          CustomTextFormField(
            label: 'Username',
            hint: 'Jhon Doe',
            // errorMessage: 'Este campo es requerido',
            prefixIcon: Icon(
              Icons.supervised_user_circle_outlined,
              color: colors.tertiaryFixedDim,
            ),
            onChanged: registerCubit.usernameChange,
            errorMessage: username.errorMessage
          ),

          const SizedBox(height: 15),

          CustomTextFormField(
            label: 'Email',
            hint: 'example@gmail.com',
            // errorMessage: 'Este campo es requerido',
            prefixIcon: Icon(
              Icons.attach_email_outlined,
              color: colors.tertiaryFixedDim,
            ),
            onChanged: registerCubit.emailChange,
            errorMessage: email.errorMessage,
          ),

          const SizedBox(height: 15),

          CustomTextFormField(
            label: 'Password',
            // errorMessage: 'Este campo es requerido',
            obscureText: true,
            prefixIcon: Icon(Icons.password, color: colors.tertiaryFixedDim),
            onChanged: registerCubit.passwordChange,
            errorMessage: password.errorMessage,
          ),

          const SizedBox(height: 15),

          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            label: const Text('Save new User'),
            icon: const Icon(Icons.supervised_user_circle),
          ),
        ],
      ),
    );
  }
}
