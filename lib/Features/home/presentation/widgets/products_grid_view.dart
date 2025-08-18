import 'package:flutter/cupertino.dart';
import 'package:fruit_hup/core/entities/product_entity.dart';

import '../../../../core/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key , required this.products});
final List<ProductEntity> products ;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing:16,
            childAspectRatio: 163/214,),
        itemBuilder: (context, index) =>  FruitItem(
          productEntity: products[index] ,
        ));
  }
}
