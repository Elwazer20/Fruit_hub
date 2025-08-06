import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hup/Features/auth/presentation/cubits/sign_in_cubit.dart';
import 'package:fruit_hup/Features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';


import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          context,
          title: "تسجيل الدخول",
          onPressed: () {},
        ),
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
