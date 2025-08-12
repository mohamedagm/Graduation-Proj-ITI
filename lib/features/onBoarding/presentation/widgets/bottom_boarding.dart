import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/routing/app_routes.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomBoarding extends StatelessWidget {
  const BottomBoarding({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: 5,
              dotWidth: 25,
              activeDotColor: AppColors.kPrimaryColor,
              dotColor: Colors.grey,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.height * 0.06,
              ),
              backgroundColor: AppColors.kPrimaryColor,
            ),
            onPressed: () {
              currentPage == 2
                  ? GoRouter.of(context).pushReplacement(AppRoutes.login)
                  : pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
            },
            child: Text(
              currentPage == 0
                  ? AppStrings.onboardingGetStarted
                  : AppStrings.onboardingNext,
              style: AppTextStyles.onBoardingTextButton,
            ),
          ),
        ],
      ),
    );
  }
}
