import 'package:RoJuTube/main/main.dart';
import 'package:RoJuTube/screens/profile/generate_animation.dart';
import 'package:RoJuTube/screens/profile/generate_avatar.dart';
import 'package:RoJuTube/ui_utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home.dart';
import '../screens/profile/profile.dart';

abstract class AppRoute {
  static const HomeRoute = "/";
  static const ContentRoute = "/create-content";
  static const ProfileRoute = "/profile";
  static const GenerateAnimationsRoute = ProfileRoute + "/profile/animation/generate";
  static const GenerateAvatarRoute = ProfileRoute + "/profile/avatar/generate";

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
      GoRoute(
        path: GenerateAnimationsRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: getGeneralAppWrapper(context, GenerateAnimationStepper(), null),
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
        path: GenerateAvatarRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: getGeneralAppWrapper(context, GenerateAvatarStepper(), null),
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
