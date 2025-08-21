import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widgets/scaffold_messenger.dart';
import '../cubit/cart_cubit.dart';
import '../views/cart_view.dart';
import '../views/products_view.dart';
import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemAdded) {
            CustomScaffoldMessenger.showSuccessMessenger(
                context: context, message: 'تم اضافه المنتج بنجاح');
          } else if (state is CartItemRemoved) {
            CustomScaffoldMessenger.showErrorMessenger(
                context: context, message: 'تم حذف المنتج بنجاح');
          }
        },
        child: IndexedStack(
          index: currentViewIndex,
          children: const [
            HomeView(),
            ProductsView(),
            CartView(),
          ],
        ));
  }
}
