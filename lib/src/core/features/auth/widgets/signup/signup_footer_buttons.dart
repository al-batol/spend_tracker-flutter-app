import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_tracker/src/core/common/widgets/custom_button.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';

class SignupFooterButtons extends StatelessWidget {
  final VoidCallback onSignUp;
  const SignupFooterButtons({super.key, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          buildWhen:
              (previous, current) =>
                  (previous.status == AuthStatus.loading) !=
                  (current.status == AuthStatus.loading),
          builder: (context, state) {
            return CustomButton(
              name: 'Sign up',
              isLoading: state.status == AuthStatus.loading,
              voidCallback: onSignUp,
            );
          },
        ),
        const SizedBox(height: 15),
        Text('Or With', style: Theme.of(context).textTheme.displaySmall),
        const SizedBox(height: 15),
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
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
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
