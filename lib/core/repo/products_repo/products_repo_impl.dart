import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/entities/product_entity.dart';
import 'package:fruit_hup/core/errors/failure.dart';
import 'package:fruit_hup/core/model/product_model.dart';
import 'package:fruit_hup/core/repo/products_repo/products_repo.dart';
import '../../services/database_service.dart';
import '../../utils/back_end_endpoints.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService
          .getData(path: BackEndEndpoints.getProducts, query: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true
      }) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackEndEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to get products'));
    }
  }
}
