import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(
    BuildContext context, {
      required String title,
      VoidCallback? onPressed,
      Widget icon=const Icon(
        Icons.arrow_back_ios_new,
      ),
    }) {

  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: onPressed,
      icon: icon,
    ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
  );
}
