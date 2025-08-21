import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/checkout/presentation/widgets/step_item.dart';

import 'active_step_item.dart';
import 'inactive_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getSteps().length,
        (index) => Expanded(
          child: StepItem(
           text: getSteps()[index] ,
            index: index.toString() ,
            isActive: index == 0,
          ),
        ),
      ),
    );
  }

}

List<String> getSteps() => [
  "الشحن",
  "العنوان",
  "الدفع",
  "المراجعه",
];