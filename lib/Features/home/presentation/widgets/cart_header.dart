import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: Color(0xFFEBF9F1)),
      child: Center(
        child: Text(
          'لديك ${context.watch<CartCubit>().cartEntity.carItems.length} منتجات في سله التسوق',
          style: TextStyles.bold13.copyWith(color: Color(0xFF1B5E37)),
        ),
      ),
    );
  }
}
