import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../generated/Assets.dart';
import '../../domain/entities/cart_item_entity.dart';
import 'cart_item_action_buttons.dart';
import 'custom_network_image.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key , required this.cartItem});
final CartItemEntity cartItem ;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: const CustomNetworkImage(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRsHDmvD20e8BV3reenO97KUDj7ETTO1KVGn5_D28baQRfPCkBd6wgUbbahnQt1PF12-0&usqp=CAU',
            ),
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
                      'بطيخ',
                      style: TextStyles.bold13,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Assets.imagesTrash,
                      ),
                    )
                  ],
                ),
                Text(
                  '3 كم',
                  textAlign: TextAlign.right,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  children: [
                    const CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '60 جنيه ',
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
  }
}
