import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_tracker/src/core/common/widgets/custom_button.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';

class SignupFooterButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupFooterButtons({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          buildWhen:
              (previous, current) =>
                  previous.isSigningUp != current.isSigningUp,
          builder: (context, state) {
            return CustomButton(
              name: 'Sign up',
              isLoading: state.isSigningUp,
              voidCallback: () {
                if (formKey.currentState!.validate()) {
                  context.read<AuthCubit>().signUp();
                }
              },
            );
          },
        ),
        const SizedBox(height: 10),
        Text('Or With', style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 10),
        CustomButton(
          name: 'Sign Up With Google',
          imagePath: 'assets/images/google.png',
          voidCallback: () {},
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),

                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  decoration: TextDecoration.underline,
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ],
    );
  }
}
