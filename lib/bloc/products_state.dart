part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingStates extends ProductsState {}

final class ProductsLoadedStates extends ProductsState {
  final List<ProductsModel> productsModel;

  const ProductsLoadedStates(this.productsModel);
  @override
  List<Object> get props => [productsModel];
}

final class ProductsErrorState extends ProductsState {
  final String errorMessage;

  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
