import 'package:go_router/go_router.dart';
import 'package:iti_project/core/routing/app_routes.dart';
import 'package:iti_project/features/onBoarding/presentation/views/splash_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
