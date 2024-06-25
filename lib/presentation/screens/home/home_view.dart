import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:philo_task/core/helpers/firebase_firestore_helper.dart';
import 'package:philo_task/models/product.dart';
import 'package:philo_task/presentation/widgets/custom_appbar.dart';
import 'package:philo_task/presentation/widgets/product_item.dart';

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
  final scrollController = ScrollController();
  List<ProductModel> allProducts = [];
  List<ProductModel> searchedProducts = [];
  //contr
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _initProducts();
    });
    super.initState();
  }

  _initProducts() async {
    allProducts = await DatabaseHelper.getProducts();
    
    setState(() {});
  }

  _buildProductsList() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 370,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        searchedProducts.isEmpty ? allProducts.length : searchedProducts.length,
        (index) => ProductItem(
          key: ValueKey(allProducts[index].sId),
          index: index,
          product: searchedProducts.isEmpty
              ? allProducts[index]
              : searchedProducts[index],
          allProducts:
              searchedProducts.isEmpty ? allProducts : searchedProducts,
          inFavScreen: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onChanged: (p0) {
            setState(() {
              searchedProducts = allProducts
                  .where((element) => element.title!.contains(p0))
                  .toList();
            });
          },
          controller: _searchController,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // _buildHeader(),
              _buildProductsList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Sets up a scroll listener that loads more posts when the user scrolls to the end of the list.
  // void _setupScrollListener() {
  //   scrollController.addListener(() {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       RouterGenerator.postsCubit.state.maybeWhen(
  //         error: (message) => _loadMorePosts(),
  //         orElse: () => _loadMorePosts(),
  //       );
  //     }
  //   });
  // }

  /// Loads the initial posts.

  /// Loads more posts.

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
