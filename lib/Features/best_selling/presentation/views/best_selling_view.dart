import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/best_selling_view_body.dart';

class BestSellingView  extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'best_selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BestSellingViewBody(),
    );
  }
}
