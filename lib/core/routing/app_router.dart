import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:iti_project/core/routing/app_routes.dart';
import 'package:iti_project/features/auth/presentation/views/login_view.dart';
import 'package:iti_project/features/auth/presentation/views/register_view.dart';
import 'package:iti_project/features/home/data/model/product_model/product_model.dart';
import 'package:iti_project/features/home/presentation/views/search_view.dart';
import 'package:iti_project/features/prefs/presentation/views/settings_view.dart';
import 'package:iti_project/features/profile/data/model/user_model.dart/user_model.dart';
import 'package:iti_project/features/home/presentation/views/home_details_view.dart';
import 'package:iti_project/features/home/presentation/views/home_view.dart';
import 'package:iti_project/features/profile/presentation/views/profile_view.dart';
import 'package:iti_project/features/profile/presentation/views/setup_profile_view.dart';
import 'package:iti_project/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:iti_project/features/onBoarding/presentation/views/splash_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: AppRoutes.setup,
        builder: (context, state) {
          final user = state.extra as UserCredential;
          return SetupProfileView(user: user);
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) {
          final user = state.extra as UserCredential;
          return HomeView(user: user);
        },
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) {
          final user = state.extra as UserModel;
          return ProfileView(user: user);
        },
      ),
      GoRoute(
        path: AppRoutes.productDetails,
        builder: (context, state) {
          final productModel = state.extra as ProductModel;
          return HomeDetailsView(productModel: productModel);
        },
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) {
          final user = state.extra as UserModel;
          return SettingsView(userModel: user);
        },
      ),
    ],
  );
}
