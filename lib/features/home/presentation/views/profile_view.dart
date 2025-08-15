import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/services/firestore_service.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';
import 'package:iti_project/features/home/presentation/manager/setupProfileCubit/setup_profile_cubit.dart';
import 'package:iti_project/features/home/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), centerTitle: true),
      body: BlocProvider(
        create: (context) => SetupProfileCubit(getIt.get<FirestoreService>()),
        child: ProfileViewBody(userModel: user),
      ),
    );
  }
}
