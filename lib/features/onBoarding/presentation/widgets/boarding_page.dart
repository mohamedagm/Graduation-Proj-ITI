import 'package:flutter/material.dart';
import 'package:iti_project/features/onBoarding/data/boarding_model.dart';
import 'package:iti_project/features/onBoarding/presentation/widgets/boarding_page_body.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({
    super.key,
    required this.pageController,
    this.onPageChanged,
  });
  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: PageView(
        controller: widget.pageController,
        onPageChanged: widget.onPageChanged,
        children: List.generate(
          3,
          (index) => BoardingPageBody(
            boardingModel: boardingList[index],
            pageController: widget.pageController,
          ),
        ),
      ),
    );
  }
}
