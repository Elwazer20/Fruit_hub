import 'package:fruit_hup/Features/checkout/domain/entities/shipping_address_entity.dart';

import '../../../home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.shippingAddress,
    required this.cartItems,
    required this.payWithCash,
  });
}
