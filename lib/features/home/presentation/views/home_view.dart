import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_bottom_app_bar.dart';
import 'package:iti_project/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      appBar: CustomAppBar(
        icon: Icon(Icons.apps),
        title: Column(
          children: [
            Text(
              AppStrings.homeAppbartext1,
              style: AppTextStyles.homeAppbartext1,
            ),
            Text(
              AppStrings.homeAppbartext2,
              style: AppTextStyles.homeAppbartext2,
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(Dio()),
        child: HomeViewBody(),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
