import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      child:  Center(
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: TextStyles.bold13.copyWith(color: Color(0xFF1B5E37)),
        ),
      ),
    );
  }
}