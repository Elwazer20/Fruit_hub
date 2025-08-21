import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/checkout/presentation/widgets/checkout_page_view.dart';
import 'package:fruit_hup/Features/checkout/presentation/widgets/checkout_steps.dart';
import 'package:fruit_hup/core/widgets/custom_app_bar.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';

import 'active_step_item.dart';
import 'inactive_step_item.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController ;
  @override
  initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {

    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CheckoutSteps(),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
            ),
          ),
          CustomButton(onPressed: (){}, text: 'التالي')
          ,SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

