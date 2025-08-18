import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_divider.dart';
import '../../domain/entities/cart_item_entity.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({required this.cartItems, super.key});
final List<CartItemEntity> cartItems ;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemCount: cartItems.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:  CartItem(
          cartItem: cartItems[index],
        ),
      ),
    );
  }
}

