import '../../../../core/entities/product_entity.dart';
import 'cart_item_entity.dart';

class CartEntity  {
  List<CarItemEntity> carItems;

  CartEntity({required this.carItems});

  addCartItem(CarItemEntity cartItem) {
    carItems.add(cartItem);
  }
  removeCartItem(CarItemEntity cartItem) {
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
CarItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in carItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CarItemEntity(productEntity: product, count: 1);
  }

}
