import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/widgets/custom_text_field.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/search_view_results.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController? searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        spacing: 15,
        children: [
          SizedBox(height: 5),
          CustomTextField(
            controller: searchController,
            hintText: AppStrings.homeSearchHint,
            sicon: IconButton(
              onPressed: () {
                if (searchController!.text.trim().isNotEmpty &&
                    searchController?.text != null) {
                  context.read<ProductsCubit>().searchProductsC(
                    word: searchController!.text,
                  );
                }
              },
              icon: Icon(Icons.search),
            ),
          ),
          SearchViewResults(),
        ],
      ),
    );
  }
}
