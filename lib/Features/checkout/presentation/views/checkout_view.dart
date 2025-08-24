import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/home/domain/entities/cart_item_entity.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});

  static const routeName = 'checkout';
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
        title: "الشحن", showBackButton: true, showNotification: false),
      body: CheckoutViewBody(),
    );
  }
}
