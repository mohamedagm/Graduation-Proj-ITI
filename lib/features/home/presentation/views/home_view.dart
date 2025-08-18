import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/services/firestore_service.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/core/themes/themeCubit/theme_cubit.dart';
import 'package:iti_project/core/widgets/custom_app_bar_leading.dart';
import 'package:iti_project/features/home/presentation/manager/productsCubit/products_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_bottom_app_bar.dart';
import 'package:iti_project/features/home/presentation/widgets/custom_drawer.dart';
import 'package:iti_project/features/home/presentation/widgets/home_view_body_products.dart';
import 'package:iti_project/features/profile/presentation/manager/ProfileCubit/profile_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});
  final UserCredential user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BlocProvider(
        create:
            (context) =>
                ProfileCubit(getIt.get<FirestoreService>())
                  ..getUserDataC(user.user!.uid),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return CustomDrawer(userModel: state.user);
            } else if (state is ProfileFailure) {
              return Drawer(child: Center(child: Text(state.errMsg)));
            } else {
              return Drawer();
            }
          },
        ),
      ),
      appBar: CustomAppBar(
        leadingWidget: Builder(
          builder: (context) {
            return CustomAppbarLeading(
              icon: Icons.menu,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(Icons.local_mall),
          ),
        ],
        title: Column(
          children: [
            Text(
              AppStrings.homeAppbartext1,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(AppStrings.homeAppbartext2),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<Dio>()),
        child: HomeViewBodyProducts(),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
