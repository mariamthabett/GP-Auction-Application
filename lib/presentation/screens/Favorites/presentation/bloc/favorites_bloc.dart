import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../models/product.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState()) {
    on<GetAllProducts>(getFavoritesItems);
    on<AddToFavorites>(addFavoriteProduct);
    on<RemoveFromFavorites>(removeFavoriteProduct);
  }

  final List<ProductModel> _products = [];

  // ____________________________________ Get favorites products ________________________________

  FutureOr<void> getFavoritesItems(
      GetAllProducts event, Emitter<FavoritesState> emit) {
    emit(state.copyWith(getProductsState: RequestState.loading));
    if (_products.isEmpty) {
      emit(state.copyWith(
        getProductsState: RequestState.error,
      ));
    } else {
      emit(state.copyWith(
        getProductsState: RequestState.success,
        products: _products,
      ));
    }
  }
  // ____________________________________ Add cart item ________________________________

  FutureOr<void> addFavoriteProduct(
      AddToFavorites event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(addProductState: RequestState.loading));
    try {
      if (_products.every((element) => element.sId != event.product.sId)) {
        _products.add(event.product);
        emit(state.copyWith(
          addProductState: RequestState.success,
          addProductMessage: 'Product added successfully to favorites',
        ));
      } else {
        emit(state.copyWith(
          addProductState: RequestState.error,
          addProductMessage: 'Product already exists in favorites',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        addProductState: RequestState.error,
        addProductMessage: 'Failed to add product to favorites',
      ));
    }
  }

  // ___________________________________ Remove cart item _______________________________

  FutureOr<void> removeFavoriteProduct(
      RemoveFromFavorites event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(deleteProductState: RequestState.loading));
    try {
      _products.removeWhere((element) => element.sId == event.product.sId);
      emit(state.copyWith(
        deleteProductState: RequestState.success,
        deleteProductMessage: 'Product removed successfully from favorites',
      ));
    } catch (e) {
      emit(state.copyWith(
        deleteProductState: RequestState.error,
        deleteProductMessage: 'Failed to remove product from favorites',
      ));
    }
  }
}
