import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/widgets/custom_button.dart';
import 'package:spend_tracker/src/core/navigation/route_names.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        CustomButton(
          name: 'Sign up',
          voidCallback: () {
            Navigator.pushNamed(context, RouteNames.signup);
          },
        ),
        CustomButton(
          name: 'Sign in',
          color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
          textColor: Theme.of(context).primaryColor,
          voidCallback: () {},
        ),
      ],
    );
  }
}
