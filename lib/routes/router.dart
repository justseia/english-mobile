import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/bottom_bar/bottom_bar.dart';
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
    initialLocation: kDebugMode ? '/' : '/${AppRoute.home}',
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
                    child: const JobsScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: ':id',
                    parentNavigatorKey: rootNavigatorKey,
                    pageBuilder: (context, routerState) {
                      final Map<String, dynamic> extra = {};
                      if (routerState.extra != null) {
                        extra.addAll(routerState.extra as Map<String, dynamic>);
                      }
                      return createPage(
                        key: routerState.pageKey,
                        child: JobSingleScreen(
                          jobId: routerState.pathParameters['id']!,
                          repeat: extra['repeat'] as bool? ?? false,
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
                    child: const JobsScreen(),
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
