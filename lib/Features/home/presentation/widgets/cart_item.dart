import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/Assets.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_item/cart_item_cubit.dart';
import 'cart_item_action_buttons.dart';
import 'custom_network_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final CarItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItem) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomNetworkImage(
                    imageUrl: cartItem.productEntity.imageUrl!),
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItem.productEntity.name!,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteProduct(cartItem);
                          },
                          child: SvgPicture.asset(
                            Assets.imagesTrash,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "${cartItem.totalWeight().toString()}  كجم",
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(
                          cartItem: cartItem,
                        ),
                        const Spacer(),
                        Text(
                          cartItem.toTalPrice().toString(),
                          style: TextStyles.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
