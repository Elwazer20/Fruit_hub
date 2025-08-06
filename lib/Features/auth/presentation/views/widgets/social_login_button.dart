import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../core/utils/app_text_styles.dart';


class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.img, required this.label, this.onPressed});

  final String img;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Color(0xFFDCDEDE),
              width: 1,
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(img),
          title: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
        ),
      ),
    );
  }
}
