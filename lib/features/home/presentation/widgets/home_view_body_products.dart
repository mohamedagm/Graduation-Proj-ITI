import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:iti_project/features/home/data/models/product_model/product_model.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_card.dart';

class HomeViewBodyProducts extends StatefulWidget {
  const HomeViewBodyProducts({super.key});

  @override
  State<HomeViewBodyProducts> createState() => _HomeViewBodyProductsState();
}

class _HomeViewBodyProductsState extends State<HomeViewBodyProducts> {
  TextEditingController? controller;
  int currIndex = 0;
  ProductModel productModel = ProductModel();
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProductsC();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              spacing: 15,
              children: [
                SizedBox(height: 5),
                CustomTextField(
                  hintText: AppStrings.homeSearchHint,
                  controller: controller,
                  validator: (value) {
                    return null;
                  },
                  picon: Icons.search,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    bool exp = index == currIndex ? true : false;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currIndex = index;
                        });
                      },
                      child: Container(
                        width: exp ? 80 : 55,
                        height: exp ? 35 : 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(16),
                            right: Radius.circular(16),
                          ),
                          color: exp ? Colors.blueAccent : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            AppStrings.homeNike,
                            style: TextStyle(
                              color: exp ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                      //clipBehavior: Clip.none, //bad in this situation
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: CustomCard(
                            productModel: state.productList[index],
                          ),
                        );
                      },
                      itemCount: state.productList.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductsFailure) {
          return Center(
            child: Text(
              state.errMsg,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
