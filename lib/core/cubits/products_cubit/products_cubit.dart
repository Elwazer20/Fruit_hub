import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../entities/product_entity.dart';
import '../../repo/products_repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productsRepo}) : super(ProductsInitial());
  final ProductsRepo productsRepo;
int productsLength = 0;
  Future<void> getProducts() async {

      emit(ProductsLoading());

      var result = await productsRepo.getProducts();

      result.fold(
              (failure) {
            emit(ProductsError(errMessage: failure.message));
          },
              (products) {
                productsLength = products.length;
            emit(ProductsLoaded(products: products));
          }
      );

  }

  Future<void> getBestSellingProducts() async {

      emit(ProductsLoading());

      var result = await productsRepo.getBestSellingProducts();

      result.fold(
              (failure) {
            emit(ProductsError(errMessage: failure.message));
          },
              (products) {

                emit(ProductsLoaded(products: products));
          }
      );

  }
}