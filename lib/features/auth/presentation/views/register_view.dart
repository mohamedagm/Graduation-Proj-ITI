import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/features/auth/data/repo/auth_repo_impl.dart';
import 'package:iti_project/features/auth/presentation/Manager/authCubit/auth_cubit.dart';
import 'package:iti_project/features/auth/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: BlocProvider(
        create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        child: const RegisterViewBody(),
      ),
    );
  }
}
