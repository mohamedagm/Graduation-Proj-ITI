import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/utils/functions/nav_to_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToBoarding(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splash,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),

              // Brand name
              Text(
                AppStrings.splashText1,
                style: Theme.of(context).textTheme.displayLarge,
              ),

              // Subtitle
              Text(
                AppStrings.splashText2,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.5),

              // Version
              Text(
                AppStrings.splashText3,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
