import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_tracker/src/core/common/constants/app_dimensions.dart';
import 'package:spend_tracker/src/core/common/utils/helper.dart';
import 'package:spend_tracker/src/core/features/auth/cubit/auth_cubit.dart';
import 'package:spend_tracker/src/core/features/auth/widgets/signup/form_fields_widget.dart';
import 'package:spend_tracker/src/core/features/auth/widgets/signup/privacy_checkbox_widget.dart';
import 'package:spend_tracker/src/core/features/auth/widgets/signup/signup_footer_buttons.dart';
import 'package:spend_tracker/src/core/navigation/route_names.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController nameCtr;
  late final TextEditingController emailCtr;
  late final TextEditingController passwordCtr;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    nameCtr = TextEditingController();
    emailCtr = TextEditingController();
    passwordCtr = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameCtr.dispose();
    emailCtr.dispose();
    passwordCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AuthStatus.success ||
            state.status == AuthStatus.failure) {
          if (state.status == AuthStatus.success) {
            Navigator.pushNamed(context, RouteNames.verification);
          } else {
            Helper.snackBar(
              context,
              message: state.message ?? '',
              isSuccess: state.status == AuthStatus.success,
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Sign Up')),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.paddingLg,
            horizontal: AppDimensions.paddingSm,
          ),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 20,
              children: [
                FormFieldsWidget(
                  nameCtr: nameCtr,
                  emailCtr: emailCtr,
                  passwordCtr: passwordCtr,
                ),
                PrivacyCheckboxWidget(),
                SignupFooterButtons(
                  onSignUp: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().signUp(
                        nameCtr.text.trim(),
                        emailCtr.text.trim(),
                        passwordCtr.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
