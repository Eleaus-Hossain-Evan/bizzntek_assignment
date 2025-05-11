import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'core/core.dart';

void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // final results = await Future.wait([
  //   SharedPreferences.getInstance(),
  //   LocalNotificationService.initialize(),
  // ]);

  // final prefs = results[0] as SharedPreferences;

  runApp(
    ProviderScope(
      overrides: [
        // sharedPrefProvider.overrideWithValue(pref),
      ],
      observers: [TalkerRiverpodObserver()],
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    useEffect(() {
      // ref
      //     .read(profileProvider.future)
      //     .then((value) => FlutterNativeSplash.remove());
      // FlutterNativeSplash.remove();

      return null;
    }, []);
    return ScreenUtilInit(
      // designSize: const Size(375, 812),
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) {
        return SkeletonizerConfig(
          data: SkeletonizerConfigData(
            effect: ShimmerEffect.raw(
              colors: [
                Colors.grey.shade300,
                const Color(0xFFF4F4F4),
                Colors.grey.shade100,
              ],
              stops: [0.1, 0.3, 0.4],
              begin: const Alignment(-1.0, -0.3),
              end: const Alignment(1.0, 0.3),
              tileMode: TileMode.clamp,
              duration: const Duration(milliseconds: 1100),
            ),
            enableSwitchAnimation: true,
            textBorderRadius: const TextBoneBorderRadius.fromHeightFactor(.4),
          ),
          child: MaterialApp.router(
            title: 'Bizzntek Assignment',
            debugShowCheckedModeBanner: false,

            //, localization
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),

            //, theme
            theme: AppTheme.lightTheme,
            //, router
            routerConfig: router,
            builder: BotToastInit(),
          ),
        );
      },
    );
  }
}
