import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/language/language_bloc.dart';
import 'core/language/language_loader.dart';
import 'core/services/connectivity/connectivity_bloc.dart';
import 'core/widgets/global_connectivity_listener.dart';
import 'core/theme/Styles.dart';
import 'core/theme/theme_bloc.dart';
import 'core/theme/theme_event.dart';
import 'core/theme/theme_state.dart';
import 'core/widgets/loader/loader_bloc.dart';
import 'core/widgets/loader/loader_overlay.dart';
import 'routes/go_pages.dart';
import 'utils/global_var.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc(box)..add(LoadTheme())),
        BlocProvider(create: (_) => LanguageBloc(box)..add(LoadLanguage())),
        BlocProvider(create: (_) => ConnectivityBloc()),
        BlocProvider(create: (_) => LoaderBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, langState) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                builder: (_, __) {
                  return BlocBuilder<LoaderBloc, LoaderState>(
                    builder: (context, loaderState) {
                      return MaterialApp.router(
                        scaffoldMessengerKey: scaffoldMessengerKey,
                        debugShowCheckedModeBanner: false,
                        routerConfig: GoPages.router,
                        theme: Styles.themeData(context, isDarkTheme: false),
                        darkTheme: Styles.themeData(context, isDarkTheme: true),
                        themeMode: themeState.themeMode,
                        locale: langState.locale,
                        supportedLocales: LanguageLoader.supportedLocales,
                        localizationsDelegates: const [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        builder: (context, child) {
                          return GlobalConnectivityListener(
                            scaffoldMessengerKey: scaffoldMessengerKey,
                            child: LoaderOverlay(
                              child: child!,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
