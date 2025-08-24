import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widgets/scaffold_messenger.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../checkout/presentation/views/checkout_view.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_item/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context.watch<CartCubit>().cartEntity.carItems.isNotEmpty) {
              Navigator.pushNamed(context, CheckoutView.routeName,
                  arguments: context.watch<CartCubit>().cartEntity.carItems);
            } else {
              CustomScaffoldMessenger.showErrorMessenger(
                  context: context, message: "السلة فارغة");
            }
          },
          text:
              'الدفع  ${context.watch<CartCubit>().cartEntity.getTotalPrice()} جنيه',
        );
      },
    );
  }
}
