import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';

class CustomDetailsInfoContainer extends StatelessWidget {
  const CustomDetailsInfoContainer({
    super.key,
    this.child,
    required this.widthRatio,
  });
  final Widget? child;
  final double widthRatio;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * widthRatio,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
          bottom: Radius.circular(16),
        ),
      ),
      child: Center(child: child),
    );
  }
}
