enum NamedRoutes {
  splash('/'),
  login('/login'),
  productDetails('/product-details'),
  register('/register'),
  home('/home'),
  favourites('/favourites'),
  navigationBar('/navigation-bar'),
  ;

  final String routeName;

  const NamedRoutes(this.routeName);
}
