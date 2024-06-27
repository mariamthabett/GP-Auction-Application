enum NamedRoutes {
  splash('/'),
  login('/login'),
  productDetails('/product-details'),
  register('/register'),
  home('/home'),
  favourites('/favourites'),
  navigationBar('/navigation-bar'),
  profile('/profile'),
  ;

  final String routeName;

  const NamedRoutes(this.routeName);
}
