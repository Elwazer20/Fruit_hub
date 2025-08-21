import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/cart_header.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';

import '../../../../constants/constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_item/cart_item_cubit.dart';
import 'cart_items_list.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              buildAppBar(
                context,
                title: "السلة",
                showBackButton: false,
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
            child: context.read<CartCubit>().cartEntity.carItems.isEmpty
                ? SizedBox()
                : CustomDivider(),
          ),
           CartItemsList(
            cartItems:context.watch<CartCubit>().cartEntity.carItems,
          ),
          SliverToBoxAdapter(
            child: context.read<CartCubit>().cartEntity.carItems.isEmpty
                ? SizedBox()
                : CustomDivider(),
          ),
        ]),
        Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: CustomCartButton())
      ],
    );
  }
}

