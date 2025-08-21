import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/checkout/presentation/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 33,
        ),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
        ),
        SizedBox(
          height: 16,
        ),
        ShippingItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
        ),
      ],
    );
  }
}