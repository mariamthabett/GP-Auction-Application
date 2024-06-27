import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:philo_task/core/constants/constants.dart';
import 'package:philo_task/core/internet/internet_connection_checker.dart';
import 'package:philo_task/core/theming/theme_manager.dart';
import 'package:philo_task/presentation/screens/Favorites/presentation/bloc/favorites_bloc.dart';
import 'package:provider/provider.dart';
import '../core/navigator/navigator.dart';
import '../core/navigator/route_generator.dart';
import '../core/navigator/route_observer.dart';
import '../providers/chat_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        BlocProvider(
            create: (context) => FavoritesBloc()..add(GetAllProducts())),
      ],
      child: ScreenUtilInit(
          designSize: Size(ScreenSizes.width, ScreenSizes.height),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
                builder: (context, child) {
                  return InternetConnectionChecker(
                    child: child!,
                  );
                },
                debugShowCheckedModeBanner: false,
                // locale: lang,
                localizationsDelegates: const [
                  // S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],
                navigatorObservers: [AppNavigationObserver()],

                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('ar', 'EG')
                ],
                // supportedLocales: L10n.all,
                navigatorKey: Go.navigatorKey,

                onGenerateRoute: RouterGenerator.getRoute,
                // initialRoute: NamedRoutes.splash.routeName,
                theme: appTheme,
              )),
    );
  }
}
