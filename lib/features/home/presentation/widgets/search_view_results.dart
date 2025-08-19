import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_card.dart';

class SearchViewResults extends StatefulWidget {
  const SearchViewResults({super.key});

  @override
  State<SearchViewResults> createState() => _SearchViewResultsState();
}

class _SearchViewResultsState extends State<SearchViewResults> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          print(state.productList.length);
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 150,

                  child: Center(
                    child: CustomCard(productModel: state.productList[index]),
                  ),
                );
              },
            ),
          );
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.errMsg));
        } else if (state is ProductsLoading) {
          return Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        }
        // in future : will be last 10 searched as ex
        return Text('Search now to discover');
      },
    );
  }
}
