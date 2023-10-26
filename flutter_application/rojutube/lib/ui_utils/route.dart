import 'package:RoJuTube/main/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home.dart';
import '../screens/profile/profile.dart';

abstract class AppRoute {
  static const HomeRoute = "/";
  static const ContentRoute = "/create-content";
  static const ProfileRoute = "/profile";

  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: HomeRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: GeneralWrapperPage(index: 0),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
                return FadeTransition(
                  opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              }
          );
        },

      ),
      GoRoute(
        path: ContentRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: GeneralWrapperPage(index: 1),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
                return FadeTransition(
                  opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              }
          );
        },
      ),
      GoRoute(
        path: ProfileRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: GeneralWrapperPage(index: 2),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
                return FadeTransition(
                  opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              }
          );
        },
      ),
    ],
  );
}
