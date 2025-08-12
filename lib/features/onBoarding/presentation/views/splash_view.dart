import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
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
      backgroundColor: AppColors.kSplashColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),

              Text(
                AppStrings.splashText1,
                style: AppTextStyles.splashText1Style,
              ),
              Text(
                AppStrings.splashText2,
                style: AppTextStyles.splashText2Style,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.5),
              Text(
                AppStrings.splashText3,
                style: AppTextStyles.splashText3Style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
