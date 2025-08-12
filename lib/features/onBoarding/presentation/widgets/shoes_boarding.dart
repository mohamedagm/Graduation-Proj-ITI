import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_assets.dart';

class ShoesBoarding extends StatelessWidget {
  const ShoesBoarding({super.key, required this.imageLink});
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.asset(AppAssets.onboardingNike),
          ),
        ),
        Positioned(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(imageLink),
          ),
        ),
      ],
    );
  }
}
