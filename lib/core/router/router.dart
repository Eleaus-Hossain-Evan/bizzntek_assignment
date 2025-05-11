import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core.dart';

part 'router.g.dart';

@Riverpod(dependencies: [])
GoRouter router(Ref ref) {
  // final listen = ValueNotifier<bool?>(auth.whenOrNull(data: (data) => data));
  // ref.watch(authProvider);

  final auth = ValueNotifier(false);

  // ref.listen(authProvider, (previous, next) {
  //   auth.value = next.valueOrNull != null;
  // });

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    // redirectLimit: 1,
    navigatorKey: AppGlobalKeys.mainNavigatorKey,
    // refreshListenable: auth,

    observers: [
      BotToastNavigatorObserver(),
    ],
    routes: [],
    redirect: (context, state) {
      // final token = ref.watch(tokenRepoRepoProvider).getAccessToken();
      // final authenticated = token != null && token.isNotEmpty;

      // final tryingSignin = state.matchedLocation == LoginPage.route;
      // final tryingVerify = state.matchedLocation == '/email/verify';
      // final tryingForgot = state.matchedLocation == ForgotPasswordScreen.route;
      // final authenticating = tryingSignin || tryingForgot || tryingVerify;

      // if (!authenticated) return authenticating ? null : LoginPage.route;

      // if (authenticating) return AppMainNav.route;

      return null;
    },
    // errorPageBuilder: (context, state) => MaterialPage(
    //   child: Scaffold(
    //     appBar: AppBar(title: const Text('Page Not Found')),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           SelectableText(state.error?.toString() ?? 'page not found'),
    //           TextButton(
    //             onPressed: () => context.go('/home'),
    //             child: const Text('Home'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
  );
}

class SlideRightToLeftTransitionPage extends CustomTransitionPage {
  SlideRightToLeftTransitionPage({
    super.key,
    required super.child,
    super.fullscreenDialog = true,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          }, // Here you may also wrap this child with some common designed widget
        );
}

class SlideLeftToRightTransitionPage extends CustomTransitionPage {
  SlideLeftToRightTransitionPage({
    super.key,
    required super.child,
    super.fullscreenDialog = true,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          }, // Here you may also wrap this child with some common designed widget
        );
}

class SlideBottomToTopTransitionPage extends CustomTransitionPage {
  SlideBottomToTopTransitionPage({
    super.key,
    required super.child,
  }) : super(
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          }, // Here you may also wrap this child with some common designed widget
        );
}

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({
    super.key,
    required super.child,
  }) : super(
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
        );
}
