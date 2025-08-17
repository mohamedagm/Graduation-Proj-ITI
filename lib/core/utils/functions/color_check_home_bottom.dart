import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';

Color colorCheckHomeBottom(index, curIndex) =>
    curIndex == index ? AppColors.primary : Colors.black;
