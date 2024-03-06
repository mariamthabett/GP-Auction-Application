import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:philo_task/core/res/color_manger.dart';
import 'package:philo_task/models/product.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton(
      {Key? key, required this.product, required this.allProducts})
      : super(key: key);
  final ProductModel product;
  final List<ProductModel> allProducts;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
          padding: const EdgeInsets.all(2.0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            color: const Color(0xFFcdacf9).withOpacity(0),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add_shopping_cart_outlined,
            color: Colors.white,
            size: 22,
          )),
      onTap: () {
        // product.isInCart = BlocProvider.of<CartCubit>(context)
        //     .toogleCartIcon(product.isInCart);
        // BlocProvider.of<CartCubit>(context)
        //     .addProductInCart(product.sId, allProducts);
      },
    );
  }
}
