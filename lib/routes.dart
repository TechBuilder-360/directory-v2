import 'package:biz_directory/screens/authentication/index.dart';
import 'package:biz_directory/screens/authentication/signup.dart';
import 'package:biz_directory/screens/onboard.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const Onboard();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'auth',
        builder: (BuildContext context, GoRouterState state) {
          return const Auth();
        },
          routes: <RouteBase>[
            GoRoute(
                path: 'sign-up',
                builder: (BuildContext context, GoRouterState state) {
                  return const SignUp();
                },
            ),
            GoRoute(
              path: 'sign-in',
              builder: (BuildContext context, GoRouterState state) {
                return const SignUp();
              },
            )
          ]
      ),
    ],
  ),
]);
