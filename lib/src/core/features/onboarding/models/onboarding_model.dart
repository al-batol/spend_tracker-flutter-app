class OnBoardingModel {
  final String title;
  final String subtitle;
  final String imagePath;

  OnBoardingModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  static final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      title: 'Gain total control of your money',
      subtitle: 'Become your own money manger and make every cent count',
      imagePath: 'assets/images/onboarding1.png',
    ),
    OnBoardingModel(
      title: 'Gain Total Control of Your Money',
      subtitle: 'Become Your Own Money Manager',
      imagePath: 'assets/images/onboarding2.png',
    ),
    OnBoardingModel(
      title: 'Gain Total Control of Your Money',
      subtitle: 'Become Your Own Money Manager',
      imagePath: 'assets/images/onboarding3.png',
    ),
  ];
}
