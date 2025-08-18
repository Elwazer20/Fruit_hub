import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fruit_hup/core/services/service_locator.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/Spalsh/Presentation/View/splash_view.dart';
import 'Features/auth/presentation/views/signin_view.dart';
import 'Features/home/presentation/views/main_view.dart';
import 'core/helper_func/on_generate_route.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/shared_preferances.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
//////////email: test@gmail.com /////////
//password: 123456789////////////
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await GoogleFonts.pendingFonts([
    GoogleFonts.cairo(),
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  FirebaseFirestore.setLoggingEnabled(true); // فعّل اللوجز
  setup();
  await Prefs.init();
  runApp(
    const FruitHup(),
  );
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: DevicePreview.appBuilder(context, child),
        );
      },
      locale: const Locale('ar'),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute:FirebaseAuth.instance.currentUser != null ? MainView.routeName : LoginView.routeName,
    );
  }
}
