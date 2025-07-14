import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/features/onboarding/models/onboarding_model.dart';

class DotsWidget extends StatelessWidget {
  final List<OnBoardingModel> onboardingList;
  final double currentPage;
  final Function(int)? onTap;

  const DotsWidget({
    super.key,
    required this.onboardingList,
    required this.currentPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: onboardingList.length,
      position: currentPage,
      decorator: DotsDecorator(
        activeSize: Size(15, 15),
        color: Theme.of(context).disabledColor,
      ),
      onTap: onTap,
    );
  }
}
