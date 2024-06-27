import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../widgets/products_grid.dart';
import '../../widgets/custom_appbar.dart';
import '../../../core/helpers/firebase_firestore_helper.dart';

/// `PostsView` is a stateful widget that displays a list of posts.
///
/// It uses a `BlocBuilder` to build the list of posts based on the state of the `PostsCubit`.
/// It also has a `ScrollController` that loads more posts when the user scrolls to the end of the list.
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProductModel> allProducts = [];
  List<ProductModel> searchedProducts = [];
  //contr
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initProducts();
    });
    super.initState();
  }

  _initProducts() async {
    allProducts = await DatabaseHelper.getProducts();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () { }
          )],
          onChanged: (p0) {
            setState(() {
              searchedProducts = allProducts
                  .where((element) => element.title!.contains(p0))
                  .toList();
            });
          },
          controller: _searchController,
        ),
        body: ProductsGrid(
          inFavScreen: false,
          products: searchedProducts.isEmpty ? allProducts : searchedProducts,
        ),
      ),
    );
  }
}
