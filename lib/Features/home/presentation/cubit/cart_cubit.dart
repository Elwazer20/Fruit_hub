import 'package:bloc/bloc.dart';
import 'package:fruit_hup/Features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/cart_item.dart';
import 'package:meta/meta.dart';

import '../../../../core/entities/product_entity.dart';
import '../../domain/entities/cart_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(carItems: []);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExists(productEntity);
    var carItems = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      // increase count
      carItems.increaseCount();
    } else {
      cartEntity.addCartItem(carItems);
    }
    emit(CartItemAdded());
  }
  void deleteProduct(CarItemEntity productEntity) {
    cartEntity.removeCartItem(productEntity);
    emit(CartItemRemoved());
  }
}
