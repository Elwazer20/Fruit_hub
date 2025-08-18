import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/helper_func/get_dummy_product.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import 'products_grid_view.dart';

class ProductGridViewBlocBuilder extends StatelessWidget {
  const ProductGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          return ProductsGridView(
            products: state.products,
          );
        }else if (state is ProductsError) {
          return CustomErrorWidget(
            msg: state.errMessage,
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: getDummyProducts(),
            ),
          ) ;
        }
      },
    );
  }
}