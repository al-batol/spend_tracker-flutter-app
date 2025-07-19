import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/app_dimensions.dart';
import 'package:spend_tracker/src/core/common/constants/colors.dart';
import 'package:spend_tracker/src/core/common/widgets/custom_button.dart';
import 'package:spend_tracker/src/core/features/auth/widgets/verification/code_cells_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  static const _fieldsCount = 6;
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;
  late Duration _duration;
  Timer? _timer;

  @override
  void initState() {
    _controllers = List.generate(
      _fieldsCount,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(_fieldsCount, (index) => FocusNode());
    _duration = const Duration(minutes: 5);
    super.initState();
  }

  void _startTimer() {
    _duration = const Duration(minutes: 5);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration -= const Duration(seconds: 1);
        if (_duration.inSeconds == 0) {
          _duration = const Duration(minutes: 5);
          _timer?.cancel();
        }
      });
    });
  }

  String _showDuration() {
    String minutes = (_duration.inMinutes).toString().padLeft(2, '0');
    String seconds = (_duration.inSeconds % 60).toString().padLeft(2, '0');

    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    for (TextEditingController controller in _controllers) {
      controller.dispose();
    }
    for (FocusNode focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verification')),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.paddingMd),
        children: [
          const SizedBox(height: 48),
          Text(
            'Enter you verification code',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          CodeCellsWidget(
            controllers: _controllers,
            focusNodes: _focusNodes,
            fieldsCount: _fieldsCount,
          ),
          const SizedBox(height: 48),
          Text(
            _showDuration(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'We\'ll send you a verification code to your email. You can check your inbox',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: _startTimer,
            child: Text(
              'Didn\'t receive the code? Send again',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 48),
          CustomButton(name: 'Verify', voidCallback: () {}),
        ],
      ),
    );
  }
}
