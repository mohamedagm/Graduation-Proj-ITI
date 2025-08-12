import 'package:iti_project/core/constants/app_assets.dart';
import 'package:iti_project/core/constants/app_strings.dart';

class BoardingModel {
  final String imageLink;
  final String title;
  final String sub;

  BoardingModel({
    required this.imageLink,
    required this.title,
    required this.sub,
  });
}

List<BoardingModel> boardingList = [
  BoardingModel(
    imageLink: AppAssets.onboardingImage1,
    title: AppStrings.onboardingTitle1,
    sub: AppStrings.onboardingcontent1,
  ),
  BoardingModel(
    imageLink: AppAssets.onboardingImage2,
    title: AppStrings.onboardingTitle2,
    sub: AppStrings.onboardingcontent2,
  ),
  BoardingModel(
    imageLink: AppAssets.onboardingImage3,
    title: AppStrings.onboardingTitle3,
    sub: AppStrings.onboardingcontent3,
  ),
];
