import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/features/home/data/model/product_model/product_model.dart';
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
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
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
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '\$${widget.productModel.price}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                widget.productModel.description!,
                style: Theme.of(context).textTheme.titleMedium,
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
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      CustomDetailsInfoContainer(
                        widthRatio: 0.4,
                        child: Text(
                          widget.productModel.warrantyInformation.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  CustomDetailsInfoContainer(
                    widthRatio: 0.7,
                    child: Text(
                      '${widget.productModel.shippingInformation}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),

              //size,type
              Center(
                child: Text(
                  'size ${widget.productModel.tags.toString()}',
                  style: Theme.of(context).textTheme.titleLarge,
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
                        style: Theme.of(context).textTheme.titleLarge,
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
                      style: Theme.of(context).textTheme.titleLarge,
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
