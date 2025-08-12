part of 'products_cubit.dart';

@immutable
sealed class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductModel> productList;

  const ProductsSuccess(this.productList);
}

final class ProductsFailure extends ProductsState {
  final String errMsg;

  const ProductsFailure(this.errMsg);
}
