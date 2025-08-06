import 'package:flutter/material.dart';

import 'Widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const SplashViewBody(),
      ),
    );
  }
}
