import 'package:flutter/material.dart';
import 'package:philo_task/feature/splash/presentation/screens/splash_view.dart';
import 'named_routes.dart';
import 'page_router/imports_page_router_builder.dart';

class RouterGenerator {
  RouterGenerator._();

  static final PageRouterBuilder _pageRouter = PageRouterBuilder();

  static Route<dynamic> getRoute(RouteSettings settings) {
    final namedRoute =
        NamedRoutes.values.firstWhere((e) => e.routeName == settings.name);
    switch (namedRoute) {
      case NamedRoutes.splash:
        return _pageRouter.build(const SplashView(), settings: settings);

      // return _pageRouter.build(TransactionHistoryView(), settings: settings);
    }
  }
}
