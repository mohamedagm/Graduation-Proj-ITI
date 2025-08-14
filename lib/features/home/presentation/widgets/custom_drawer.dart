
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/routing/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.user,
  });

  final UserCredential user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Hey, ${user.user!.displayName ?? 'null'}'),
            accountEmail: Text(user.user!.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                user.user!.photoURL ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQykzoZeCE0p7LeuyHnLYCdPP2jju9d5PaMeA&s',
              ),
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              GoRouter.of(context).push(AppRoutes.profile, extra: user);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Navigate to settings
            },
          ),
          const Spacer(), // يزحف بالـ Logout لتحت
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
