import 'package:flutter/material.dart';
import 'package:fruit_hup/Features/checkout/presentation/widgets/checkout_page_view.dart';
import 'package:fruit_hup/Features/checkout/presentation/widgets/checkout_steps.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';


class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController ,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
            ),
          ),
          CustomButton(
              onPressed: () {
                pageController.animateToPage(currentPageIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              text: getNextButtonText(currentPageIndex),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
  String getNextButtonText(int currentPageIndex) {
    if (currentPageIndex == 2) {
      return ' الدفع عبر PayPal   ';
    }
    return 'التالي';
  }
}
