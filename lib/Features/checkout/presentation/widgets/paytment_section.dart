import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/checkout/presentation/widgets/shipping_address_widget.dart';



import 'order_summry_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 24,
        ),
        OrderSummeryWidget(),
        SizedBox(
          height: 16,
        ),
        ShippingAddressWidget(),
      ],
    );
  }
}