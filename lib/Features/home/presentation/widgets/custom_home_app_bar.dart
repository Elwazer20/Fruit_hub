import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/helper_func/get_user.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/Assets.dart';
import 'notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing:
      NotificationWidget(),
      leading:
      Image.asset(
        Assets.imagesProfileImage,
      ),
      title:  Text(
      "صباح الخير ..!",
      textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(
          color: Color(0xFF949D9E),
        ),
      ),
      subtitle:Text(
       getUser().name,
        textAlign: TextAlign.right,
        style: TextStyles.bold16,
      ),

    );
  }
}
