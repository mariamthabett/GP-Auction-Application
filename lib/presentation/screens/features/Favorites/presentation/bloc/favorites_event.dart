part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class AddToFavorites extends FavoritesEvent {
  final ProductModel product;
  const AddToFavorites({required this.product});
}

class GetAllProducts extends FavoritesEvent {
  const GetAllProducts();
}

class RemoveFromFavorites extends FavoritesEvent {
  final ProductModel product;
  const RemoveFromFavorites({required this.product});
}

class addCartItemEvent extends FavoritesEvent {
  final ProductModel product;
  const addCartItemEvent({required this.product});
}
