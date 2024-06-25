import 'package:flutter/material.dart';
import 'package:philo_task/ProductInfo.dart';
import 'package:philo_task/presentation/screens/favourites/favourites_view.dart';
import 'package:philo_task/presentation/screens/home/home_view.dart';
import 'package:philo_task/presentation/screens/login_screen/login_view.dart';
import 'package:philo_task/presentation/screens/register_screen/register_view.dart';
import 'package:philo_task/presentation/screens/splash_screen/splash_view.dart';
import 'package:philo_task/presentation/widgets/botton_navigation_bar.dart';
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
      case NamedRoutes.login:
        return _pageRouter.build(LoginView(), settings: settings);
      //register
      case NamedRoutes.register:
        return _pageRouter.build(RegisterView(), settings: settings);
      //home
      case NamedRoutes.home:
        return _pageRouter.build(HomeView(), settings: settings);
      //favourites
      case NamedRoutes.favourites:
        return _pageRouter.build(FavouritesView(), settings: settings);
      case NamedRoutes.productDetails:
        return _pageRouter.build(ProductInfo(), settings: settings);
      case NamedRoutes.navigationBar:
        return _pageRouter.build(NavigationBarScreen(), settings: settings);
    }
  }
}
