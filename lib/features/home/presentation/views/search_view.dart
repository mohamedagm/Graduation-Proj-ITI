import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/core/widgets/custom_app_bar.dart';
import 'package:iti_project/core/widgets/custom_app_bar_leading.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidget: CustomAppbarLeading(
          icon: Icons.keyboard_arrow_left,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: Text(AppStrings.search),
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<Dio>()),
        child: SearchViewBody(),
      ),
    );
  }
}
