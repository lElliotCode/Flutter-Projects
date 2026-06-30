import 'package:flutter/material.dart';
import 'package:form_app/presentation/widgets/widgets.dart';

final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Uusario')),
      body: const _RegisterView(),
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
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
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (value.length < 6) return 'Should have at least 6 characters';
              return null;
            },
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
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (!emailRegExp.hasMatch(value)) return 'Incorrect format';
              return null;
            },
          ),

          const SizedBox(height: 15),

          CustomTextFormField(
            label: 'Password',
            // errorMessage: 'Este campo es requerido',
            obscureText: true,
            prefixIcon: Icon(Icons.password, color: colors.tertiaryFixedDim),
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (value.length < 6) return 'Should have at least 6 characters';
              return null;
            },
          ),

          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
              print('$username, $email, $password');
            },
            label: const Text('Save new User'),
            icon: const Icon(Icons.save_alt_outlined),
          ),
        ],
      ),
    );
  }
}
