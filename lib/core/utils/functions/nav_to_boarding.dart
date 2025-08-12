import 'package:go_router/go_router.dart';
import 'package:iti_project/core/routing/app_routes.dart';

void navigateToBoarding(context) {
  Future.delayed(const Duration(seconds: 3), () {
    GoRouter.of(context).push(AppRoutes.onboarding);
  });
}
