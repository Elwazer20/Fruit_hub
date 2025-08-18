import '../../../../core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
   int count;
  CartItemEntity({required this.product ,  this.count = 0});
}