import 'package:flutter/material.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
import 'package:iti_project/features/onBoarding/data/boarding_model.dart';
import 'package:iti_project/features/onBoarding/presentation/widgets/ellipse_shape.dart';
import 'package:iti_project/features/onBoarding/presentation/widgets/shoes_boarding.dart';
import 'package:iti_project/features/onBoarding/presentation/widgets/boarding_text.dart';

class BoardingPageBody extends StatelessWidget {
  const BoardingPageBody({
    super.key,
    required this.pageController,
    required this.boardingModel,
  });
  final PageController pageController;
  final BoardingModel boardingModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EllipseShape(),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            ShoesBoarding(imageLink: boardingModel.imageLink),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            BoardingText(
              text: boardingModel.title,
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(fontSize: 40),
            ),
            SizedBox(height: 10),
            BoardingText(
              text: boardingModel.sub,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}
