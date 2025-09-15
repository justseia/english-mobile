import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/bottom_bar/bottom_bar.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/screens/test_screen.dart';
import '../screens/profile/profile_screen.dart';
import 'route_constants.dart';

Page<dynamic> createPage({
  required Widget child,
  required ValueKey<String> key,
}) {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return MaterialPage(
      key: key,
      child: child,
    );
  } else {
    return CupertinoPage(
      key: key,
      child: child,
    );
  }
}

class EnglishRoute {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  final GoRouter generateRoute = GoRouter(
    initialLocation: kDebugMode ? '/home/1' : '/${AppRoute.home}',
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoute.home}',
                pageBuilder: (context, routerState) {
                  return createPage(
                    key: routerState.pageKey,
                    child: const HomeScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: ':id',
                    parentNavigatorKey: rootNavigatorKey,
                    pageBuilder: (context, routerState) {
                      return createPage(
                        key: routerState.pageKey,
                        child: TestScreen(
                          id: routerState.pathParameters['id']!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoute.profile}',
                pageBuilder: (context, routerState) {
                  return createPage(
                    key: routerState.pageKey,
                    child: const ProfileScreen(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
