import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/widgets/custom_app_bar_leading.dart';
import 'package:iti_project/features/home/data/models/product_model/product_model.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeDetailsViewTopSection extends StatelessWidget {
  const HomeDetailsViewTopSection({
    super.key,
    required this.pageController,
    required this.productModel,
  });

  final PageController pageController;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          //details app bar
          CustomAppBar(
            leadingWidget: CustomAppbarLeading(
              icon: Icons.keyboard_arrow_left,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.local_mall)),
            ],
            title: Text(
              'Men’s Shoes',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          //pageview
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.8,
            child: PageView(
              controller: pageController,
              children: List.generate(
                4,
                (index) => Image.network(productModel.images![index]),
              ),
            ),
          ),

          //indicator
          SmoothPageIndicator(
            controller: pageController,
            count: 4,
            effect: WormEffect(
              activeDotColor: AppColors.primary,
              dotWidth: 18,
              dotHeight: 8,
              dotColor: Colors.grey[400]!,
            ),
          ),
        ],
      ),
    );
  }
}
