import 'package:flutter/material.dart';
import 'package:philo_task/models/product.dart';
import 'package:philo_task/presentation/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products, required this.inFavScreen,
  });

  final List<ProductModel> products;
  final bool inFavScreen;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) => ProductItem(
        key: ValueKey(products[index].sId),
        index: index,
        product: products[index],
        inFavScreen: inFavScreen,
      ),
    );
  }
}
