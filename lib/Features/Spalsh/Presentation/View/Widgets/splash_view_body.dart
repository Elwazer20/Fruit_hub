import 'package:flutter/cupertino.dart';
import 'package:fruit_hup/Features/home/presentation/views/home_view.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:fruit_hup/core/services/shared_preferances.dart';
import 'package:fruit_hup/generated/Assets.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants/constants.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import '../../../../onboarding/presentation/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.splashImagesPlant),
          ],
        ),
        SvgPicture.asset(
          Assets.splashImagesLogo,
        ),
        SvgPicture.asset(
          Assets.splashImagesBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  executeNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(KisOnBoardingViewSeen) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        var isUserLoggedIn = FirebaseAuthService().isLoggedIn();
        if (isUserLoggedIn) {
          if (mounted) {
            Navigator.of(context).pushNamed(LoginView.routeName);
          }
        } else {
          if (mounted) {
            Navigator.of(context).pushNamed(LoginView.routeName);
          }
        }
      } else {
        if (mounted) {
          Navigator.of(context).pushNamed(OnBoardingView.routeName);
        }
      }
    });
  }
}
