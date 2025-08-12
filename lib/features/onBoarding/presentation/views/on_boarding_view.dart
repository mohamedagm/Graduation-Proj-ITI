import 'package:flutter/material.dart';
import 'package:iti_project/features/onBoarding/presentation/widgets/boarding_page.dart';
import 'package:iti_project/features/onBoarding/presentation/widgets/bottom_boarding.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BoardingPage(
            pageController: pageController,
            onPageChanged:
                (value) => setState(() {
                  currentPage = value;
                }),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          BottomBoarding(
            pageController: pageController,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}
