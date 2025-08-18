import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/services/firestore_service.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/features/profile/presentation/manager/ProfileCubit/profile_cubit.dart';
import 'package:iti_project/features/profile/presentation/widgets/setup_profile_view_body.dart';

class SetupProfileView extends StatelessWidget {
  const SetupProfileView({super.key, required this.user});
  final UserCredential user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(getIt.get<FirestoreService>()),
        child: SetupProfileViewBody(user: user),
      ),
    );
  }
}
