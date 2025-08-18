import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/routing/app_routes.dart';
import 'package:iti_project/features/home/data/models/user_model.dart/user_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Hey, ${userModel.name}'),
            accountEmail: Text(userModel.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(userModel.photoUrl),
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(AppStrings.profile),
            onTap: () {
              GoRouter.of(context).push(AppRoutes.profile, extra: userModel);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Navigate to settings
            },
          ),
          const Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Logout logic
            },
          ),
        ],
      ),
    );
  }
}
