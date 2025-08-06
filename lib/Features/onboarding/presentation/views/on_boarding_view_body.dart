import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruit_hup/constants/constants.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';

import '../../../../core/services/shared_preferances.dart';
import '../../../auth/presentation/views/signin_view.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  Color? activeColor;
  Color inActiveColor = AppColors.primaryColor.withOpacity(0.5);

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
            activeColor: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 29),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: CustomButton(
              onPressed: () {
                Prefs.setBool(KisOnBoardingViewSeen, true);
                Navigator.of(context)
                    .pushNamed(LoginView.routeName);
              },
              text: 'ابدأ الان'),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
