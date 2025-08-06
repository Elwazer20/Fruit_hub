import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_text_styles.dart';

import '../../../best_selling/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        children: [
          Text(
            'الاكثر مبيعا',
            textAlign: TextAlign.right,
            style: TextStyles.bold13.copyWith(
              color: Colors.black,
            ),
          ) , Spacer(),
          Text(
      'المزيد',
      textAlign: TextAlign.right,
      style: TextStyles.regular13.copyWith(
        color: Color(0xFF949D9E),
      )
      ),
        ],
      ),
    );
  }
}
