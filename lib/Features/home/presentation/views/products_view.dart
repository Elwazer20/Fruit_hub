import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/repo/products_repo/products_repo.dart';
import '../../../../core/services/service_locator.dart';
import '../widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
       productsRepo:  getIt.get<ProductsRepo>(),
      ),
      child: const ProductsViewBody(),
    );
  }
}