 import 'package:flutter/cupertino.dart';
import 'package:fruit_hup/core/utils/app_color.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/Assets.dart';
import 'on_boarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          currentPage: 0,
          isVisible: true,
          image: Assets.onBoardingImageLogoPageOne,
          backgroundImg: Assets.onBoardingImageBackgroundPageOne,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fruit",
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                "HUB",
                style: TextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                " مرحبًا بك في ",
                style: TextStyles.bold23,
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',

        ),
        PageViewItem(
          currentPage: 1,

          isVisible: false,
          // or use pageController.initialPage == 0
          image: Assets.onBoardingImageLogoPageTwo,
          backgroundImg: Assets.onBoardingImageBackgroundPageTwo,
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية" ,

          title: Text(
            "ابحث وتسوق",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF0C0D0D),
                fontSize: 23,
                fontFamily: 'Cairo',
                height: 0),
          ),
        ),
      ],
    );
  }
}
