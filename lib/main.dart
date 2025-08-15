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
// تظبيط الفلو لما يسجل بجوجل ساين ان الداتا مش بتروح فاير ستور الكيس دي مش متهندله
// تظبيط الهوم انها تحول الكريدنشل ل يوزر مودل عشان هتبعته بعد كدا لباقي الأجزاء
// بس وبعد كدا تكمل ف باقي المشروع وتشوف اي فاضل
// زي الثيم بالشيرد برفرنس والسايفد بالهايف وبس كدا اظن يكفي حبة حبشتكنات
// انميشنز - شمر لودينج رايق كدا - غيرهم لو ف بالي حاجه تاني