import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/Assets.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0x0A000000),
            blurRadius: 9,
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
              width: 20,
              child: Center(child: SvgPicture.asset(Assets.imagesFilter))),
          hintText: 'ابحث عن.....!',
          fillColor: const Color(0xFFF9fafa),
          hintStyle:
              TextStyles.regular13.copyWith(color: const Color(0xff949d9e)),
          filled: true,
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.imagesSearchIcon,
              ),
            ),
          ),
          border: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Color(0xffe6e9e9),
        width: 1,
      ),
    );
  }
}
