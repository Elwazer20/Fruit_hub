import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/home/presentation/views/products_view.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/home_view.dart';
import '../widgets/main_view_body.dart';
import 'cart_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = '/home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            setState(() {
              currentViewIndex = index;
            });
            print(currentViewIndex);
          },
        ),
        body: SafeArea(
          child: MainViewBody(currentViewIndex: currentViewIndex , ),
        ),
      ),
    );
  }
}

