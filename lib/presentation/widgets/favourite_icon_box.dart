import 'package:flutter/material.dart';

import '../../models/product.dart';

class FavouriteIconBox extends StatelessWidget {
  const FavouriteIconBox({
    Key? key,
    required this.product,
    required this.index,
    this.padding,
    this.unFavouriteCaseColorOfTheIcon,
    this.favouriteCaseColorOfTheIcon,
    this.unFavouriteCaseColorOfTheContainer,
    this.favouriteCaseColorOfTheContainer,
    required this.onTap,
    this.iconSize = 22,
  }) : super(key: key);
  final ProductModel product;
  final int index;
  final EdgeInsets? padding;
  final Color? unFavouriteCaseColorOfTheIcon;
  final Color? favouriteCaseColorOfTheIcon;
  final Color? unFavouriteCaseColorOfTheContainer;
  final Color? favouriteCaseColorOfTheContainer;
  final void Function()? onTap;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
          padding: padding,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            color: unFavouriteCaseColorOfTheContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.favorite_border,
            color: unFavouriteCaseColorOfTheIcon,
            size: iconSize,
          )),
      onTap: onTap,
    );
  }
}
