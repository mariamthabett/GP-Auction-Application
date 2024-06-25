import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../models/product.dart';
import 'custom_cart_buttom.dart';
import 'custom_favourite_icon_button.dart';
import 'custom_image.dart';

import '../../core/navigator/named_routes.dart';
import '../../core/navigator/navigator.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final List<ProductModel> allProducts;
  final bool inFavScreen;
  final int index;
  final double raduis;

  const ProductItem(
      {Key? key,
      this.raduis = 20,
      required this.index,
      required this.product,
      required this.allProducts,
      required this.inFavScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
     Go.toNamed(NamedRoutes.productDetails, arguments: product);
      },
      child: Container(
        width: 200,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          color: Colors.grey,
        ),
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      tileMode: TileMode.mirror,
                      colors: [
                        Color(0xFFcdacf9),
                        Color(0xFF4568dc),
                      ]),
                )),
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
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/tag-dollar.svg",
                        width: 17,
                        height: 17,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        product.price!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
