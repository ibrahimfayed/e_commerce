import 'package:e_commerce/core/resources/assets_manager.dart';

class OnBoardingModel {
  final String image;
  final String backgroundImage;
  final String title;
  final String description;
  final String buttonName;

  OnBoardingModel({
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.description,
    required this.buttonName,
  });

  static List<OnBoardingModel> onBoardingModels = [
    OnBoardingModel(
      image: ImageAssets.logo,
      backgroundImage: ImageAssets.onboardingBackground1,
      title: 'Welcome to',
      description:
          "Discover a world of elegance with AccessoryHUB. Explore our wide collection of trendy, high-quality accessories and enjoy the best deals.",
      buttonName: 'Skip',
    ),
    OnBoardingModel(
      image: ImageAssets.logo,
      backgroundImage: ImageAssets.onboardingBackground2,
      title: 'Shop with Style',
      description:
          'We offer carefully selected accessories for every taste. Browse photos, read details and reviews, and find the perfect piece to match your style.',
      buttonName: 'Start Now',
    ),
  ];
}
