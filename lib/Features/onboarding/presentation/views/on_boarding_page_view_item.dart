import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../constants/constants.dart';
import '../../../../core/services/shared_preferances.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../auth/presentation/views/signin_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.currentPage,
    required this.isVisible,
    required this.image,
    required this.backgroundImg,
    required this.subTitle,
    required this.title,
  });

  final int currentPage;

  final String image, backgroundImg, subTitle;
  final bool isVisible;

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImg,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: currentPage != 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Prefs.setBool(KisOnBoardingViewSeen, true);
                          Navigator.of(context).pushNamed(LoginView.routeName);
                        },
                        child: Text(
                          'تخط ',
                          style: TextStyles.regular13
                              .copyWith(color: const Color(0xFF949D9E)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            textDirection: TextDirection.rtl,
            subTitle,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xff4E5456),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
