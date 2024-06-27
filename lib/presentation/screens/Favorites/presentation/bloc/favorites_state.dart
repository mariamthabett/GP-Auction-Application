part of 'favorites_bloc.dart';

enum RequestState {
  stable,
  loading,
  success,
  error,
}

class FavoritesState extends Equatable {
  final List<ProductModel> products;
  final RequestState getProductsState;

  final String addProductMessage;
  final RequestState addProductState;

  final String deleteProductMessage;
  final RequestState deleteProductState;

  const FavoritesState({
    this.products = const [],
    this.getProductsState = RequestState.stable,
    this.addProductMessage = '',
    this.addProductState = RequestState.stable,
    this.deleteProductMessage = '',
    this.deleteProductState = RequestState.stable,
  });

  FavoritesState copyWith({
    List<ProductModel>? products,
    RequestState? getProductsState,
    String? addProductMessage,
    RequestState? addProductState,
    String? deleteProductMessage,
    RequestState? deleteProductState,
  }) =>
      FavoritesState(
        products: products ?? this.products,
        getProductsState: getProductsState ?? this.getProductsState,
        addProductMessage: addProductMessage ?? this.addProductMessage,
        addProductState: addProductState ?? this.addProductState,
        deleteProductMessage: deleteProductMessage ?? this.deleteProductMessage,
        deleteProductState: deleteProductState ?? this.deleteProductState,
      );
  @override
  List<Object> get props => [
        products,
        getProductsState,
        addProductMessage,
        addProductState,
        deleteProductMessage,
        deleteProductState
      ];
}
