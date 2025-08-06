import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_func/build_error_bar.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../cubits/sign_in_cubit.dart';
import 'signin_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          scaffoldMessengerBar(
            state.error.toString(),
            context,
          );
        } else if (state is SignInSuccess) {
          scaffoldMessengerBar(
            "You are logged in successfully",
            context,
          );
          Navigator.pushNamed(context, HomeView.routeName);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: ModalProgressHUD(
              inAsyncCall: state is SignInLoading ? true : false,
              child: const SignInViewBody()),
        );
      },
    );
  }
}
