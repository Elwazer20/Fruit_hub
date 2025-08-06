import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/Features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_func/build_error_bar.dart';
import '../../cubits/sign_up_cubit.dart';
import '../signin_view.dart';

class SignupViewBodyBlocBuilder extends StatelessWidget {
  const  SignupViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          scaffoldMessengerBar(
            state.error,
            context,
          );
        } else if (state is SignUpSuccess) {
          scaffoldMessengerBar(
            " account created successfully ",context,
          );
          Navigator.pushNamed(context, LoginView.routeName);
        } else if (state is SignUpLoading) {
          // Show loading indicator
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignUpLoading, child: const SignupViewBody());
      },
    );
  }
}
