import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_tracker/src/core/common/widgets/custom_text_field.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';

class FormFieldsWidget extends StatelessWidget {
  final TextEditingController nameCtr;
  final TextEditingController emailCtr;
  final TextEditingController passwordCtr;
  const FormFieldsWidget({
    super.key,
    required this.nameCtr,
    required this.emailCtr,
    required this.passwordCtr,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          buildWhen:
              (previous, current) =>
                  (previous.status == AuthStatus.loading) !=
                  (current.status == AuthStatus.loading),
          builder: (context, state) {
            return CustomTextField(
              controller: nameCtr,
              hintText: "Name",
              errorText: state.errors['name']?.join(', '),
              isEnabled: state.status != AuthStatus.loading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            );
          },
        ),
        BlocBuilder<AuthCubit, AuthState>(
          buildWhen:
              (previous, current) =>
                  (previous.status == AuthStatus.loading) !=
                  (current.status == AuthStatus.loading),
          builder: (context, state) {
            return CustomTextField(
              controller: emailCtr,
              hintText: "Email",
              errorText: state.errors['email']?.join(', '),
              isEnabled: state.status != AuthStatus.loading,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value.trim())) {
                  return 'Enter a valid email';
                }
                return null;
              },
            );
          },
        ),
        BlocBuilder<AuthCubit, AuthState>(
          buildWhen:
              (previous, current) =>
                  (previous.status == AuthStatus.loading) !=
                      (current.status == AuthStatus.loading) ||
                  previous.isPassHidden != current.isPassHidden,
          builder: (context, state) {
            return CustomTextField(
              hintText: "Password",
              errorText: state.errors['password']?.join(', '),
              controller: passwordCtr,
              isPassword: true,
              isHidden: state.isPassHidden,
              isEnabled: state.status != AuthStatus.loading,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }
}
