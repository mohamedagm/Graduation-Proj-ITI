import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/core/routing/app_router.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SetupService().setupDI();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
