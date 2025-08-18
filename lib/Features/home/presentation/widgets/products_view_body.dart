import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/products_view_header.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/search_text_field.dart';

import '../../../../constants/constants.dart';
import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'products_grid_view.dart';
import 'products_grid_view_bloc_builder.dart';
import 'best_selling_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';

class   ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({
    super.key,
  });

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
             buildAppBar(context, title: "المنتجات", showBackButton: false),
              SizedBox(
                height: KTopPadding,
              ),
              SearchTextField(),
              SizedBox(
                height: 12,
              ),
              ProductsViewHeader(
                productsLength: context
                    .read<ProductsCubit>().productsLength,
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        ProductGridViewBlocBuilder(),
      ]),
    );
  }
}


