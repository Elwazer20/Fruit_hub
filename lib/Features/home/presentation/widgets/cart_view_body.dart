import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/cart_header.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';

import '../../../../constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_divider.dart';
import 'cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
            slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              buildAppBar(
                context,
                title: "السلة",
                showBackButton: true,
                showNotification: false,
              ),
              SizedBox(
                height: KTopPadding,
              ),
              CartHeader(),
              SizedBox(
                height: 12,
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: CustomDivider(),
          ),
          const CartItemsList(
            cartItems: [],
          ),
        ]),
        Positioned(
          left: 16,
          right: 16,


          bottom: MediaQuery.of(context).size.height * 0.05,
            child: CustomButton(onPressed: (){}, text: "استكمال الطلب",))
      ],
    );
  }
}