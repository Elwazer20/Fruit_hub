import 'package:flutter/cupertino.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/best_selling_grid_view.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/featured_list.dart';
import 'package:fruit_hup/Features/home/presentation/widgets/search_text_field.dart';
import 'package:fruit_hup/constants/constants.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';

import 'best_selling_header.dart';
import 'featured_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              SizedBox(
                height: KTopPadding,
              ),
              SearchTextField(),
              SizedBox(
                height: 12,
              ),
              FeaturedList(),
              SizedBox(
                height: 12,
              ),
              BestSellingHeader(),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        BestSellingGridView(),
      ]),
    );
  }
}
