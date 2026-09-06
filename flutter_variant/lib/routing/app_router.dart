import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/booking_screen.dart';
import '../screens/confirmed_screen.dart';
import '../screens/discover_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/saved_screen.dart';
import '../screens/scaffold_with_nav_bar.dart';
import '../screens/search_screen.dart';
import '../screens/tour_details_screen.dart';
import 'app_routes.dart';

/// App-wide [GoRouter], built once for [MaterialApp.router].
///
/// `discover`, `search`, and `saved` share a [StatefulShellRoute] so each
/// tab keeps its own navigation stack while the bottom nav bar stays put -
/// the Navigation 2.0 equivalent of a tab-based navigator.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.discover,
              builder: (context, state) => const DiscoverScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.search,
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.saved,
              builder: (context, state) => const SavedScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.tourDetails,
      builder: (context, state) => TourDetailsScreen(
        tourId: state.pathParameters['tourId']!,
      ),
    ),
    GoRoute(
      path: AppRoutes.booking,
      builder: (context, state) => BookingScreen(
        tourId: state.pathParameters['tourId']!,
      ),
    ),
    GoRoute(
      path: AppRoutes.confirmed,
      builder: (context, state) => const ConfirmedScreen(),
    ),
  ],
);
