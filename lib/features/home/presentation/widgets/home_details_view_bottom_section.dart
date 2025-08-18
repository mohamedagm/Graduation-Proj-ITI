import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
import 'package:iti_project/features/home/data/models/product_model/product_model.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_details_info_style.dart';

class HomeDetailsViewBottomSection extends StatefulWidget {
  const HomeDetailsViewBottomSection({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<HomeDetailsViewBottomSection> createState() =>
      _HomeDetailsViewBottomSectionState();
}

class _HomeDetailsViewBottomSectionState
    extends State<HomeDetailsViewBottomSection> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title,price,desc
              Text(
                widget.productModel.title!,
                style: AppTextStyles.displayMedium,
              ),
              Text(
                '\$${widget.productModel.price}',
                style: AppTextStyles.titleLarge,
              ),
              Text(
                widget.productModel.description!,
                style: AppTextStyles.titleMedium,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),

              //stock,warranty,ships
              Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDetailsInfoContainer(
                        widthRatio: 0.4,
                        child: Text(
                          '${widget.productModel.availabilityStatus} '
                          '${widget.productModel.stock}',
                          style: AppTextStyles.bodyLarge,
                        ),
                      ),
                      CustomDetailsInfoContainer(
                        widthRatio: 0.4,
                        child: Text(
                          widget.productModel.warrantyInformation.toString(),
                          style: AppTextStyles.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  CustomDetailsInfoContainer(
                    widthRatio: 0.7,
                    child: Text(
                      '${widget.productModel.shippingInformation}',
                      style: AppTextStyles.bodyLarge,
                    ),
                  ),
                ],
              ),

              //size,type
              Center(
                child: Text(
                  'size ${widget.productModel.tags.toString()}',
                  style: AppTextStyles.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                  (index) => GestureDetector(
                    onTap:
                        () => setState(() {
                          curIndex = index;
                        }),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow:
                            index == curIndex
                                ? [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.blueAccent,
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  ),
                                ]
                                : [],
                        color:
                            index == curIndex
                                ? AppColors.primary
                                : AppColors.backgroundLight,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 38}',
                          style: TextStyle(
                            color:
                                index == curIndex
                                    ? AppColors.backgroundLight
                                    : Color(0xff707B81),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //price,button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.homeDetailsPrice),
                      Text(
                        '\$${widget.productModel.price}',
                        style: AppTextStyles.titleLarge,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        50,
                      ),
                    ),
                    child: Text(
                      AppStrings.homeDetailsAddToCard,
                      style: AppTextStyles.titleLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
