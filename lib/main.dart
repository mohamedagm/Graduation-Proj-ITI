import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:iti_project/core/routing/app_router.dart';
import 'package:iti_project/core/services/setup_service.dart';
import 'package:iti_project/core/themes/app_theme.dart';
import 'package:iti_project/core/themes/themeCubit/theme_cubit.dart';
import 'package:iti_project/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SetupService().setupDI();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.isLight ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }
}
// تظبيط الفلو لما يسجل بجوجل ساين ان الداتا مش بتروح فاير ستور الكيس دي مش متهندله✅
//لسا فيها تكه انه لو جاي من جوجل ييجي بصورته بس كدا كدا الصوره لسا مش متهندله بجد
// تظبيط الهوم انها تحول الكريدنشل ل يوزر مودل عشان هتبعته بعد كدا لباقي الأجزاء✅
//بس لسا فيها تكه كدا مش ضروري دلوقتي

// بس وبعد كدا تكمل ف باقي المشروع وتشوف اي فاضل
// زي الثيم بالشيرد برفرنس والسايفد بالهايف وبس كدا اظن يكفي حبة حبشتكنات
// انميشنز - شمر لودينج رايق كدا - غيرهم لو ف بالي حاجه تاني
