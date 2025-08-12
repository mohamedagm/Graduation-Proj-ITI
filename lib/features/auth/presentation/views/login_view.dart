import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/features/auth/data/repo/auth_repo_impl.dart';
import 'package:iti_project/features/auth/presentation/Manager/authCubit/auth_cubit.dart';
import 'package:iti_project/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      body: BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        child: const LoginViewBody(),
      ),
    );
  }
}
