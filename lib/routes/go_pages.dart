import 'package:go_router/go_router.dart';
import '../features/home/views/home.dart';
import '../features/onboarding/views/onboarding_screen.dart';

class GoPages {
  static final List<GoRoute> pages = [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return OnboardingScreen();
      },
      routes: [
        GoRoute(
          path: HomeView.routeName,
          builder: (context, state) {
            return HomeView();
          },
        ),
      ],
    ),
  ];

  static final GoRouter router = GoRouter(routes: pages);
}
