import 'package:flutter/material.dart';

import '../../Features/home/presentation/widgets/notification_widget.dart';
import '../utils/app_text_styles.dart';

AppBar buildAppBar(context){
 return  AppBar(
    actions: [ Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: NotificationWidget(),
    )],

    backgroundColor: Colors.white,
leading: GestureDetector(
  onTap: (){
    Navigator.pop(context);
  },
  child: Icon(
    Icons.arrow_back_ios_new,
) ,),
    title: Text(
      'الاكثر مبيعا',
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
    centerTitle: true,
  );
}