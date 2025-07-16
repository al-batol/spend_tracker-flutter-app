import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';

class PrivacyCheckboxWidget extends StatelessWidget {
  const PrivacyCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.5,
          child: BlocBuilder<AuthCubit, AuthState>(
            buildWhen:
                (previous, current) =>
                    previous.isPolicyChecked != current.isPolicyChecked ||
                    previous.isEnabled != current.isEnabled,
            builder: (context, state) {
              return Checkbox(
                value: state.isPolicyChecked,
                onChanged:
                    state.isEnabled
                        ? (_) {
                          context.read<AuthCubit>().togglePolicy();
                        }
                        : null,
              );
            },
          ),
        ),
        const SizedBox(width: 2), // spacing between checkbox and text
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By signing up, you agree to the',
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: ' Terms of Service Policy',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
