import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';

abstract class AppTextStyles {
  // splash
  static final splashText1Style = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final splashText2Style = TextStyle(fontSize: 20, color: Colors.white);
  static final splashText3Style = TextStyle(
    color: Colors.white,
    wordSpacing: 1,
  );
  // onBoarding
  static final onBoardingTitleStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w500,
  );
  static final onBoardingSubTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.khintColor,
  );
  static final onBoardingTextButton = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  // login
  static const TextStyle authTitleStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle authSubTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.khintColor,
  );

  static const TextStyle loginRecoveryPasswordStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.khintColor,
  );

  static const TextStyle authAccountStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.khintColor,
  );

  static const TextStyle authGoogleSignInStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Color(0xff1A2530),
  );

  static const TextStyle textButtonStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
  //home
  static const TextStyle homeAppbartext1 = TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle homeAppbartext2 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle homeShoesName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xff1A2530),
  );
  static const TextStyle homeShoesPrice = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xff1A2530),
  );
  static const TextStyle kDetailsTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle kDetailsDesc = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle kDetailsShoesPrice = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Color(0xff1A2530),
  );
  static const TextStyle kDetailsShoesInfo = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );
}
