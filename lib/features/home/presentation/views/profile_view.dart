import 'package:flutter/material.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';
import 'package:iti_project/features/home/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileViewBody(userModel: user));
  }
}
