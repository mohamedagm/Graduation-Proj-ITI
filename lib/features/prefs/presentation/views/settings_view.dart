import 'package:flutter/material.dart';
import 'package:iti_project/features/prefs/presentation/widgets/settings_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/constants/app_strings.dart';
import 'package:iti_project/core/widgets/custom_app_bar.dart';
import 'package:iti_project/core/widgets/custom_app_bar_leading.dart';
import 'package:iti_project/features/profile/data/model/user_model.dart/user_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppStrings.settings),
        leadingWidget: CustomAppbarLeading(
          icon: Icons.keyboard_arrow_left,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: SettingsViewBody(),
    );
  }
}
