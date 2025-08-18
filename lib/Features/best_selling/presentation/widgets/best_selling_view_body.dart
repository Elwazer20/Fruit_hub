import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/presentation/widgets/notification_widget.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: "الأكثر مبيعا",
        context,



      ),
    );
  }
}
