import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:fruit_hup/core/services/service_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/sign_up_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'حساب جديد',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SignupViewBodyBlocBuilder(),
      ),
    );
  }
}
