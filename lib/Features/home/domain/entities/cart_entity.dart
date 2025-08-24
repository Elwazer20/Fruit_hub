import '../../../../core/entities/product_entity.dart';
import 'cart_item_entity.dart';

class CartEntity  {
  List<CartItemEntity> carItems;

  CartEntity({required this.carItems});

  addCartItem(CartItemEntity cartItem) {
    carItems.add(cartItem);
  }
  removeCartItem(CartItemEntity cartItem) {
    carItems.remove(cartItem);
  }
double getTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in carItems) {
      totalPrice += cartItem.toTalPrice();
    }
    return totalPrice;
  }

  isExists(ProductEntity product) {
    for (var cartItem in carItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }
CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in carItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }

}
