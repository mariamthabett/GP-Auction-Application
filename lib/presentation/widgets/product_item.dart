import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:philo_task/presentation/screens/Favorites/presentation/bloc/favorites_bloc.dart';

import 'custom_image.dart';
import '../../models/product.dart';
import '../../core/navigator/navigator.dart';
import '../../core/navigator/named_routes.dart';
import 'package:philo_task/core/theming/colors.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final bool inFavScreen;
  final int index;
  final double raduis;

  const ProductItem({
    Key? key,
    this.raduis = 20,
    required this.index,
    required this.product,
    required this.inFavScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Go.toNamed(NamedRoutes.productDetails, arguments: product),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          color: Colors.grey,
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              tileMode: TileMode.mirror,
              colors: [
                Color(0xFFcdacf9),
                Color(0xFF4568dc),
              ]),
        ),
        child: Stack(
          children: [
            SizedBox(
              child: CustomImage(
                product.image!,
                radius: raduis,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: 12,
              left: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      product.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: ColorsManager.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    '\$ ${product.price!}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (inFavScreen)
              Positioned(
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: ColorsManager.red,
                  ),
                  onPressed: () =>
                      BlocProvider.of<FavoritesBloc>(context, listen: false)
                          .add(RemoveFromFavorites(product: product)),
                ),
                top: 0,
                right: 2,
              ),
          ],
        ),
      ),
    );
  }
}
