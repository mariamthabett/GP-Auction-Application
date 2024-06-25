import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:philo_task/presentation/screens/features/Favorites/presentation/bloc/favorites_bloc.dart';

import '../widgets/new_app_bar.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc()..add(GetAllProducts()),
      child: Scaffold(
        appBar: NewAppBar(title: 'Favorites'),
        body: BlocConsumer<FavoritesBloc, FavoritesState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.getProductsState) {
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.success:
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(state.products[index].title!),
                    );
                  },
                );
              case RequestState.error:
                return Center(child: Text(' You have no favorites yet'));
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
