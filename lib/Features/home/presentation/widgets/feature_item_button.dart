import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';

import '../../../../core/utils/app_text_styles.dart';

class FeatureItemButton extends StatelessWidget {
  const FeatureItemButton({super.key, required this.onPressed});
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Colors.white,),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: FittedBox(child: Text("تسوق الان",style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),)),
        ),
      ),
    );
  }
}
