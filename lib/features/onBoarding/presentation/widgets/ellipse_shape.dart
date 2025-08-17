import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';

class EllipseShape extends StatelessWidget {
  const EllipseShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 194,
      top: -182,
      child: Stack(
        children: [
          Container(
            width: 389,
            height: 389,
            decoration: BoxDecoration(
              color: AppColors.boardingEllipse1,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 100,
            top: 100,
            child: Container(
              width: 389 / 2,
              height: 389 / 2,
              decoration: BoxDecoration(
                color: AppColors.boardingEllipse2,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
