import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:philo_task/presentation/screens/features/Favorites/presentation/bloc/favorites_bloc.dart';

import '../../../../../widgets/products_grid.dart';
import '../widgets/new_app_bar.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<FavoritesBloc>(context).add(GetAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(title: 'Favorites'),
      body: BlocConsumer<FavoritesBloc, FavoritesState>(
        listenWhen: (previous, current) =>
            previous.deleteProductState != current.deleteProductState,
        listener: (context, state) {
          if (state.deleteProductState == RequestState.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.deleteProductMessage),
              ),
            );
          } else if (state.deleteProductState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.deleteProductMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.getProductsState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.success:
              return ProductsGrid(
                inFavScreen: true,
                products: state.products,
              );
            case RequestState.error:
              return Center(child: Text(' You have no favorites yet'));
            default:
          }
          return Container();
        },
      ),
    );
  }
}
