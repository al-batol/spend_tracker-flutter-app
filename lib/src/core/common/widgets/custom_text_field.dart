import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isPassword;
  final bool? isHidden;
  final bool? isEnabled;
  final FormFieldValidator<String>? validator;
  const CustomTextField({
    super.key,
    required this.controller,
    this.isPassword = false,
    required this.hintText,
    required this.validator,
    this.isHidden = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHidden!,
      enabled: isEnabled,
      decoration: InputDecoration(
        labelText: hintText,
        suffixIcon:
            !isPassword!
                ? null
                : IconButton(
                  icon: Icon(
                    isHidden!
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().togglePasswordEye();
                  },
                ),
      ),
      validator: validator,
    );
  }
}
