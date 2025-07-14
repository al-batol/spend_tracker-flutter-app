import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/app_dimensions.dart';
import 'package:spend_tracker/src/core/features/onboarding/models/onboarding_model.dart';

class SlidesWidget extends StatelessWidget {
  final PageController pageController;
  final List<OnBoardingModel> onboardingList;
  const SlidesWidget({
    super.key,
    required this.pageController,
    required this.onboardingList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: onboardingList.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Image.asset(
                width: MediaQuery.of(context).size.width / 1.5,
                onboardingList[index].imagePath,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLg,
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      onboardingList[index].title,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      onboardingList[index].subtitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
