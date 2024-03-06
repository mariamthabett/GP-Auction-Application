import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:philo_task/core/res/color_manger.dart';
import 'package:philo_task/models/product.dart';
import 'package:philo_task/presentation/widgets/favourite_icon_box.dart';

class CustomFavouriteIconButton extends StatelessWidget {
  const CustomFavouriteIconButton(
      {Key? key, required this.product, required this.index})
      : super(key: key);
  final ProductModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return FavouriteIconBox(
      product: product,
      index: index,
      padding: const EdgeInsets.all(2.0),
      favouriteCaseColorOfTheIcon: Colors.white,
      unFavouriteCaseColorOfTheIcon: Colors.white,
      favouriteCaseColorOfTheContainer: ColorManager.myTeal,
      unFavouriteCaseColorOfTheContainer:
          const Color(0xFFcdacf9).withOpacity(0),
      onTap: () {
        // product.isFav =
        //     BlocProvider.of<ProductsCubit>(context).toggleFavourite(
        //   product.isFav,
        //   index,
        //   product.sId!,
        // );
      },
    );
  }
}
