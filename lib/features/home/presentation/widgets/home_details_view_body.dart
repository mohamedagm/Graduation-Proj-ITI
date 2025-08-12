import 'package:flutter/material.dart';
import 'package:iti_project/features/home/data/models/product_model/product_model.dart';
import 'package:iti_project/features/home/presentation/widgets/home_details_view_bottom_section.dart';
import 'package:iti_project/features/home/presentation/widgets/home_details_view_top_section.dart';

class HomeDetailsViewBody extends StatefulWidget {
  const HomeDetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<HomeDetailsViewBody> createState() => _HomeDetailsViewBodyState();
}

class _HomeDetailsViewBodyState extends State<HomeDetailsViewBody> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeDetailsViewTopSection(
          productModel: widget.productModel,
          pageController: pageController,
        ),
        HomeDetailsViewBottomSection(productModel: widget.productModel),
      ],
    );
  }
}
