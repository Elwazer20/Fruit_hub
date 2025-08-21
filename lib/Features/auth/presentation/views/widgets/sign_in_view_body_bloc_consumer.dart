import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../home/presentation/views/main_view.dart';
import '../../cubits/sign_in_cubit.dart';
import 'signin_view_body.dart';
import 'package:fruit_hup/core/widgets/scaffold_messenger.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          CustomScaffoldMessenger.showErrorMessenger(
          message:   state.error.toString(),
          context:  context,
          );
        } else if (state is SignInSuccess) {
          CustomScaffoldMessenger.showSuccessMessenger(
            message:   "You are logged in successfully",
            context:   context,
          );
          Navigator.pushNamed(context, MainView.routeName);
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
