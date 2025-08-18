import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/products_grid_view.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/featured_list.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/search_text_field.dart';
import 'package:fruit_hup/constants/constants.dart';
import 'package:fruit_hup/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';

import '../../../../core/repo/products_repo/products_repo.dart';
import '../../../../core/services/service_locator.dart';
import 'best_selling_header.dart';
import 'featured_item.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        productsRepo: getIt<ProductsRepo>(),
      ),
      child: HomeViewBody(),
    );
  }
}
