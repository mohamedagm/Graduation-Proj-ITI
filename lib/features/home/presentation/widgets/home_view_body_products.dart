import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/routing/app_routes.dart';
import 'package:iti_project/core/widgets/custom_text_field.dart';
import 'package:iti_project/features/home/data/model/product_model/product_model.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_card.dart';

class HomeViewBodyProducts extends StatefulWidget {
  const HomeViewBodyProducts({super.key});

  @override
  State<HomeViewBodyProducts> createState() => _HomeViewBodyProductsState();
}

class _HomeViewBodyProductsState extends State<HomeViewBodyProducts> {
  TextEditingController? searchController;
  int currIndex = 0;
  ProductModel productModel = ProductModel();
  List<String> categories = [
    'mens-shoes',
    'womens-shoes',
    'mens-shirts',
    'womens-dresses',
  ];
  List<bool> isPressedCategory = [false, false, false, false];
  List<ProductModel> current = [];
  List<ProductModel> mens = [];
  List<ProductModel> womens = [];
  List<ProductModel> shirts = [];
  List<ProductModel> dresses = [];
  @override
  void initState() {
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          SizedBox(height: 5),
          InkWell(
            onTap: () => GoRouter.of(context).push(AppRoutes.search),
            child: CustomTextField(
              enabled: false,
              hintText: AppStrings.homeSearchHint,
              controller: searchController,
              picon: Icons.search,
            ),
          ),
          Text(
            'Popular Categories',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              bool exp = index == currIndex ? true : false;
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    currIndex = index;
                  });
                  // if (!isPressedCategory[0] && currIndex == 0) {
                  //   await context.read<ProductsCubit>().getProductsC(
                  //     category: categories[0],
                  //   );
                  //   mens = context.read<ProductsCubit>().productListC;
                  //   print(mens.length);
                  //   isPressedCategory[0] = true;
                  // } else
                  if (!isPressedCategory[1] && currIndex == 1) {
                    await context.read<ProductsCubit>().getProductsC(
                      category: categories[1],
                    );
                    womens = context.read<ProductsCubit>().productListC;
                    print(womens.length);
                    isPressedCategory[1] = true;
                  } else if (!isPressedCategory[2] && currIndex == 2) {
                    await context.read<ProductsCubit>().getProductsC(
                      category: categories[2],
                    );
                    shirts = context.read<ProductsCubit>().productListC;
                    print(shirts.length);
                    isPressedCategory[2] = true;
                  } else if (!isPressedCategory[3] && currIndex == 3) {
                    await context.read<ProductsCubit>().getProductsC(
                      category: categories[3],
                    );
                    dresses = context.read<ProductsCubit>().productListC;
                    print(dresses.length);
                    isPressedCategory[3] = true;
                  }
                  // if (currIndex == 0) {
                  //   current = mens;
                  // } else
                  if (currIndex == 1) {
                    current = womens;
                  } else if (currIndex == 2) {
                    current = shirts;
                  } else {
                    current = dresses;
                  }
                },
                child: Container(
                  width:
                      exp
                          ? MediaQuery.of(context).size.width * 0.3
                          : MediaQuery.of(context).size.width * 0.2,
                  height:
                      exp
                          ? MediaQuery.of(context).size.height * 0.04
                          : MediaQuery.of(context).size.height * 0.035,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(16),
                      right: Radius.circular(16),
                    ),
                    color: exp ? Colors.blueAccent : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      index == 0
                          ? AppStrings.men
                          : index == 1
                          ? AppStrings.women
                          : index == 2
                          ? AppStrings.shirt
                          : AppStrings.dress,
                      style: TextStyle(
                        color: exp ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsSuccess) {
                return Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: CustomCard(
                            productModel:
                                current.isEmpty
                                    ? state.productList[index]
                                    : current[index],
                          ),
                        );
                      },
                      itemCount:
                          current.isEmpty
                              ? state.productList.length
                              : current.length,
                    ),
                  ),
                );
              } else if (state is ProductsFailure) {
                return Center(
                  child: Text(
                    state.errMsg,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              } else if (state is ProductsLoading) {
                return Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Text('Data is loading'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
