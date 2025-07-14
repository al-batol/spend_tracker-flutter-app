import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/app_dimensions.dart';
import 'package:spend_tracker/src/core/features/onboarding/models/onboarding_model.dart';
import 'package:spend_tracker/src/core/features/onboarding/widgets/buttons_widget.dart';
import 'package:spend_tracker/src/core/features/onboarding/widgets/dots_widget.dart';
import 'package:spend_tracker/src/core/features/onboarding/widgets/slides_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  late final List<OnBoardingModel> onboardingList;
  late double currentPage;
  @override
  void initState() {
    pageController = PageController();
    onboardingList = OnBoardingModel.onBoardingList;
    currentPage = 0.0;
    onSlidingUpdates();
    super.initState();
  }

  void onSlidingUpdates() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingLg),
        child: Column(
          children: [
            SlidesWidget(
              pageController: pageController,
              onboardingList: onboardingList,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingSm,
              ),
              child: Column(
                spacing: 20,
                children: [
                  DotsWidget(
                    currentPage: currentPage,
                    onboardingList: onboardingList,
                    onTap: (index) {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  const ButtonsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
