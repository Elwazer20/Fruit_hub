import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text
,style: TextStyles.bold13    .copyWith(
          color:  AppColors.primaryColor
        )    )
      ]
    );
  }
}
