import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/services/firestore_service.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/manager/setupProfileCubit/setup_profile_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_bottom_app_bar.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_drawer.dart';
import 'package:iti_project/features/home/presentation/widgets/home_view_body_products.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
  final UserCredential user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BlocProvider(
        create:
            (context) =>
                SetupProfileCubit(getIt.get<FirestoreService>())
                  ..getUserDataC(user.user!.uid),
        child: BlocBuilder<SetupProfileCubit, SetupProfileState>(
          builder: (context, state) {
            if (state is SetupProfileSuccess) {
              return CustomDrawer(userModel: state.user);
            } else {
              return Drawer();
            }
          },
        ),
      ),
      backgroundColor: AppColors.kBackGroundColor,
      appBar: CustomAppBar(
        onPressedBag: () {},
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
        child: HomeViewBodyProducts(),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
